class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:linkedin]
  belongs_to :industry
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

  before_update :subscribe_to_mailjet?

  # attr_accessor :industry_subcategory_ids, :prospect_area_ids

  def full_name
    return "#{first_name} #{last_name}"
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

  def self.linkedin_params(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:first_name, :last_name)
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params[:linkedin_email] = auth.info.email
    user_params[:picture_url] = auth.info.image
    user_params[:linkedin_url] = auth.info.urls.public_profile
    user_params[:location] = auth.info.location.name # "#{auth.info.location.name} (auth.info.location.country.code)"
    user_params[:language] = auth.info.location.country.code.downcase == 'fr' ? 'fr' : 'en'
    most_recent_position = auth.extra.raw_info.positions['values'].max_by {|p| Date.new(p.startDate.year,p.startDate.month, 1)}
    user_params[:job_title] = most_recent_position.title
    user_params[:company] = most_recent_position.company.name
    user_params[:industry] = Industry.where(name: auth.extra.raw_info.industry).first_or_create
    # Language
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
    attrs_to_restore = changes.select {|attr_, v| v[0].present? && v[1] != v[0]}.reject {|attr_| %w(token token_expiry).include?(attr_)}
    restore_attributes(attrs_to_restore.keys)
  end


  def subscribe_to_mailjet?
    if changes[:nl_subscription] #&& nl_subscription
      Mailjet::Contactslist_managecontact.create(id: ENV['MAILJET_LIST_ID'], action: "addforce", email: email, name: full_name,
        properties: {
          first_name: first_name,
          last_name: last_name,
          company: company,
          job_title: job_title,
          language: language,
          newsletter_sub: nl_subscription
      })
    end
  end

  # def prospect_areas_ids=(values)
  # end

  # def industry_subcategory_ids=(values)
  #   self.industry_subcategory_ids =
  # end

  # def tag_ids=(values)
  #   self.tag_ids = values.map {|v| v.to_i == 0 ? ActsAsTaggableOn::Tag.create(name: v.singularize.capitalize).id : v}
  # end
end
