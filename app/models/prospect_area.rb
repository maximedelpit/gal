class ProspectArea < ApplicationRecord
  has_many :zones, dependent: :destroy
  has_many :users, through: :zones

  validate :one_of_them

  def to_s
    [country, region, departement, zipcode].compact.join(', ')
  end

  def one_of_them
    if [country, region, departement, zipcode].compact.blank?
      errors.add :country, "Must have at least a country, region, department or zipcode"
    end
  end
end
