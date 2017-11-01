class IndustrySubcategory < ApplicationRecord
  # belongs_to :industry # should connect indu / indu_subs?
  has_many :subcategories
  has_many :users, through: :subcategories

  validates :name, presence: true

  alias_method :subies, :subcategories
end
