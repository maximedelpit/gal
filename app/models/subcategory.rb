class Subcategory < ApplicationRecord
  belongs_to :user
  belongs_to :industry_subcategory

  delegate :name, to: :industry_subcategory, prefix: false, allow_nil: true
end
