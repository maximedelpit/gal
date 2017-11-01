class Lead < ApplicationRecord
  belongs_to :user
  has_many :propositions
  has_many :targets, through: :propositions

  COMPANY_SIZES = %w(0-10 10-25 25-100 100-250 250-1000 >1000)
  validates :last_name, :company, :company_size, :location,  :description, presence: true
  validates :description, length: {
    in: 10..300,
    too_short: "%{count} characters is the minimum allowed",
    too_long: "%{count} characters is the maximum allowed"
  }
  validates :company_size, inclusion: { in: COMPANY_SIZES,
     message: "%{value} is not a valid size" }
  acts_as_taggable

  alias_method :seller, :user

  def buyer
    # TO DO => use proposition state...
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

end
