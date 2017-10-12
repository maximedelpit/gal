class Lead < ApplicationRecord
  belongs_to :user

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
end
