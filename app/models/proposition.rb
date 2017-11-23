class Proposition < ApplicationRecord
  belongs_to :lead
  belongs_to :user, optional: true

  before_save :set_user

  private

  def set_user
    self.user = User.where(email: mail).or(User.where(linkedin_email: mail)).first
  end
end
