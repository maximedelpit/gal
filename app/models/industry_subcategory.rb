class IndustrySubcategory < ApplicationRecord
  include Validatable
  # belongs_to :industry # should connect indu / indu_subs?
  has_many :subcategories, dependent: :destroy
  has_many :users, through: :subcategories

  validates :name, presence: true

  acts_as_taggable

  alias_method :subies, :subcategories
end
