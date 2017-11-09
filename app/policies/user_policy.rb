class UserPolicy < ApplicationPolicy

  def edit?
    update_password?
  end

  def update_password?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
