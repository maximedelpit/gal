class ProspectArea < ApplicationRecord
  include Validatable
  has_many :zones, dependent: :destroy
  has_many :users, through: :zones

  before_save :set_name
  validates :name, presence: true, uniqueness: true


  def one_of_them
    if [country, region, department, zipcode].compact.blank?
      errors.add :country, "Must have at least a country, region, department or zipcode"
    end
  end

  def set_name
    name = to_s
  end

  def to_s
    [country, region, department, zipcode].compact.join(', ')
  end
end
