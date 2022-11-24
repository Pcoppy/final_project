class EditorPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.subscription != "none" || record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def new?
    !user.editor
  end

  def create?
    !user.editor
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.subscription == "none" ? scope.where(user: user) : scope.all
    end
  end
end
