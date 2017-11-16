class ProspectArea < ApplicationRecord
  has_many :zones, dependent: :destroy
  has_many :users, through: :zones

  before_save :set_name
  validates :name, presence: true


  def one_of_them
    if [country, region, departement, zipcode].compact.blank?
      errors.add :country, "Must have at least a country, region, department or zipcode"
    end
  end

  def set_name
    name = to_s
  end

  def to_s
    [country, region, departement, zipcode].compact.join(', ')
  end
end
