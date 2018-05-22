class Lead < ApplicationRecord
  belongs_to :user
  has_many :propositions, dependent: :destroy

  # has_many :targets, through: :propositions, class_name: "User",  foreign_key: :user_id

  COMPANY_SIZES = %w(0-10 11-25 26-100 101-500 500+)
  WITHIN = ['asap', '15_days', '1_month', '3_months', '6_months', '12_months', 'over_12_months']

  STATES = %w(created confirmed to_requalify rejected proposed sold)
  LIMITS = [["Tous", nil], [1,1], [2,2], [3, 3]]

  # Global
  validates :user_id, presence: true
  validates :for_my_self, inclusion: { in: [true, false] }
  validates :state, inclusion: { in: STATES}, if: :active?

  # Description step validation
  validates :description, presence: true, if: -> {validation_for?(:description) || active?}
  validates :description, length: { in: 10..2000 }, if: -> {validation_for?(:description) || active?}
  validates :within, inclusion: { in: WITHIN }, if: -> {validation_for?(:description) || active?}

  # Company step validation
  validates :company, :company_size, :location, presence: true, if: -> {validation_for?(:company) || active?}
  validates :company_size, inclusion: { in: COMPANY_SIZES }, if: -> {validation_for?(:company) || active?}

  # Contact step validation
  validates :last_name, :job_title, :mail, presence: true, if: -> {validation_for?(:contact) || active?}
  validates :phone, presence: true, allow_blank: false, if: -> {validation_for?(:contact) || active?}

  acts_as_taggable
  # accepts_nested_attributes_for :propositions, reject_if: :all_blank, allow_destroy: true
  after_update :upsert_in_spreadsheet, if: :extractable?
  before_destroy :destroy_in_spreadsheet


  alias_method :seller, :user

  def buyer
    # TO DO => use proposition state...
  end

  def contact_fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def extractable?
    # TO DO => check when rails v upgrade for changes
    # DEPRECATION WARNING: The behavior of `attribute_change` inside of after callbacks will be changing
    # in the next version of Rails. The new return value will reflect the behavior of calling the method
    # after `save` returned (e.g. the opposite of what it returns now).
    # To maintain the current behavior, use `saved_change_to_attribute` instead.
    build_status == 'active' && changes.present?
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
