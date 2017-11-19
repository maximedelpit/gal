class Lead < ApplicationRecord
  belongs_to :user, optional: true
  has_many :propositions

  # has_many :targets, through: :propositions, class_name: "User",  foreign_key: :user_id

  COMPANY_SIZES = %w(0-10 11-25 26-100 101-250 500+)
  WITHIN = ['1_month', '3_months', '6_months', '12_months', 'over_12_months']
  STATES = %w(created confirmed to_requalify rejected proposed sold)

  # Global
  validates :user_id, presence: true
  validates :state, inclusion: { in: STATES, message: "%{value} is not a valid state" }#, if: :active?

  # Description step validation
  validates :description, presence: true#, if: -> {validation_for?(:description) || active?}
  validates :description, length: {
    in: 10..300,
    too_short: "%{count} characters is the minimum allowed",
    too_long: "%{count} characters is the maximum allowed"
  }, if: -> {validation_for?(:description) || active?}

  # Company step validation
  validates :company, :company_size, :location, presence: true#, if: -> {validation_for?(:company) || active?}
  validates :company_size, inclusion: { in: COMPANY_SIZES,
     message: "%{value} is not a valid size" }#, if: -> {validation_for?(:company) || active?}
  validates :within, inclusion: { in: WITHIN,
   message: "%{value} is not a valid implementation period" }#, if: -> {validation_for?(:company) || active?}

  # Contact step validation
  validates :last_name, :job_title, :mail, presence: true#, if: -> {validation_for?(:contact) || active?}


  # validates :last_name, :job_title, :mail, :company, :company_size, :location,
  #   :description, :job_title, :mail, presence: true if: :active?
  # validates :description, length: {
  #   in: 10..300,
  #   too_short: "%{count} characters is the minimum allowed",
  #   too_long: "%{count} characters is the maximum allowed"
  # }, if: :active?
  # validates :company_size, inclusion: { in: COMPANY_SIZES,
  #    message: "%{value} is not a valid size" }, if: :active?

  acts_as_taggable

  alias_method :seller, :user

  def buyer
    # TO DO => use proposition state...
  end

  def contact_fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def private_fields
    return self.class.private_fields
  end

  def public_fields
    return self.class.public_fields
  end

  def self.private_fields
    return %i(first_name last_name company phone mail)
  end

  def self.public_fields
    return column_names.map(&:to_sym).reject{|c| private_fields.include?(c)}
  end

  def active?
    build_status == 'active'
  end

  def validation_for?(step_key)
    return build_status == "#{step_key}"
  end
end
