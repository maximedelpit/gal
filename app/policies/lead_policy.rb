class LeadPolicy < ApplicationPolicy

  def create?
    return true
  end

  def show?
    user == record.user || user.admin
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
