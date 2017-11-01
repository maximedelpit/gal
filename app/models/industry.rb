class Industry < ApplicationRecord
  # has_many :industry_subcategories # should connect indu / indu_subs?
  has_many :users

  validates :name, presence: true
end
