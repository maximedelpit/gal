class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]
  belongs_to :industry, optional: true
  has_many :subcategories, dependent: :destroy
  has_many :industry_subcategories, through: :subcategories
  has_many :zones, dependent: :destroy
  has_many :prospect_areas, through: :zones
  has_many :leads, dependent: :nullify
  acts_as_taggable


  before_update :mark_as_registered?

  STATES = %w(linkedin_ok registered)

  validates :email, :language, :zones, :subcategories, :taggings, presence: true, on: :update
  validates :accepts_tos, presence: true, acceptance: { accept: true }, on: :update
  validates :state, inclusion: { in: STATES,
   message: "%{value} is not a valid state" }

  alias_method :subies, :subcategories
  alias_method :industry_subies, :industry_subcategories
  delegate :name, to: :industry, prefix: true, allow_nil: true

  after_update :subscribe_to_mailjet?
  # after_save :extract_db_to_drive # NB: temp disable du to memory bloat
  after_create :insert_in_spreadsheet, if: :extractable?
  after_update :upsert_in_spreadsheet, if: :extractable?
  before_destroy :destroy_in_spreadsheet
  # attr_accessor :industry_subcategory_ids, :prospect_area_ids


  def extractable?
    # after create.... / edit profile
    if changed? == false || changed == ["sign_in_count", "current_sign_in_at", "updated_at"] || changed == ["sign_in_count", "current_sign_in_at", "last_sign_in_at", "updated_at"] || changed == ["token", "token_expiry", "updated_at"] || changed == ["sign_in_count", "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip", "updated_at"]
      return false
    else
      return true
    end
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  def self.add_lkdn_to_logs(auth)
    logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
    logger.tagged("LKDN_AUTH_1") { logger.debug auth }
    puts "\n"
    logger.tagged("LKDN_AUTH_2") { logger.debug auth.info.slice(:first_name, :last_name) }
    puts "\n"
    logger.tagged("LKDN_AUTH_3") { logger.debug auth.credentials.token }
    puts "\n"
    logger.tagged("LKDN_AUTH_4") { logger.debug auth.credentials.expires_at }
    puts "\n"
    logger.tagged("LKDN_AUTH_5") { logger.debug auth.info&.email }
    puts "\n"
    logger.tagged("LKDN_AUTH_6") { logger.debug auth.info&.image }
    puts "\n"
    logger.tagged("LKDN_AUTH_7") { logger.debug auth.info&.urls&.public_profile }
    puts "\n"
    logger.tagged("LKDN_AUTH_9") { logger.debug auth.info&.location&.name }
    puts "\n"
    logger.tagged("LKDN_AUTH_9") { logger.debug auth.info&.location&.country&.code&.downcase }
    puts "\n"
    logger.tagged("LKDN_AUTH_10") { logger.debug auth&.extra&.raw_info&.industry }
    puts "\n"
    logger.tagged("LKDN_AUTH_11") { logger.debug auth&.extra&.raw_info&.positions }
  end

  def self.find_for_linkedin_oauth(auth, override=false)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.assign_attributes(linkedin_params(auth))
      user.reject_linkedin_changes unless override
    else
      user = User.new(linkedin_params(auth))
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.state = :linkedin_ok
    end
    user.email = user.linkedin_email if user.email.blank?
    user.save
    return user
  end

  def self.get_position(auth)
    if auth&.extra&.raw_info&.positions['values']&.is_a?(Array)
      begin
        exp = auth&.extra&.raw_info&.positions['values']&.max_by {|p| Date.new(
          p&.startDate&.year || Date.today.year, p&.startDate&.month || 1, 1
        )}
      rescue ArgumentError => e
        logger.error e
        exp = auth&.extra&.raw_info&.positions['values']&.first || nil
      end
      return exp
      # return auth&.extra&.raw_info&.positions['values']&.first
    elsif auth&.extra&.raw_info&.positions['values']&.is_a?(String)
      return auth.extra.raw_info.positions['values']
    else
      return nil
    end
  end

  def self.linkedin_params(auth)
    add_lkdn_to_logs(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:first_name, :last_name)
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params[:linkedin_email] = auth.info&.email
    user_params[:picture_url] = auth.info&.image
    user_params[:linkedin_url] = auth.info&.urls&.public_profile
    user_params[:location] = auth.info&.location&.name # "#{auth.info.location.name} (auth.info.location.country.code)"
    user_params[:language] = auth.info&.location&.country&.code&.downcase == 'fr' ? 'fr' : 'en'
    most_recent_position = get_position(auth)
    user_params[:job_title] = most_recent_position&.title
    user_params[:company] = most_recent_position&.company&.name
    user_params[:industry] = Industry.where(name: auth&.extra&.raw_info&.industry).first_or_create
    return user_params.to_h
  end

  def mark_as_registered?
    if state != 'registered' && email.present? && language.present? && subcategories.present? && zones.present? && taggings.present?
      assign_attributes(state: 'registered')
    end
  end

  def reject_linkedin_changes
    # The purpose of the method is to avoid overwriting fields user has manually changed
    # TO DO
    # whitelist attributes that changed while value was previously set => TBD
    rejected_cols = %w(token token_expiry picture_url)
    attrs_to_restore = changes.select {|attr_, v| v[0].present? && v[1] != v[0]}.reject {|attr_| rejected_cols.include?(attr_)}
    restore_attributes(attrs_to_restore.keys)
  end

  def subscribe_to_mailjet?
    if changes[:nl_subscription] #&& nl_subscription # temporary deactivated
      SubscribeToMailjetList.perform_later(id)
    end
  end
end
