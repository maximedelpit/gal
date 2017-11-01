class ProspectArea < ApplicationRecord
  has_many :zones
  has_many :users, through: :zones

  validate :one_of_them

  def to_s
    [country, region, city, zipcode].compact.join(', ')
  end

  def one_of_them
    if [country, region, city, zipcode].compact.blank?
      errors.add :country, "Must have at least a country, region city or zipcode"
    end
  end
end
