class BookPolicy < ApplicationPolicy

  def index?
    paid
  end

  def show?
    paid
  end

  def new?
    user_exists
  end

  def create?
    user_exists
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  private

  def paid
    user.subscription != "none"
  end

  def user_exists
    User.ids.include?(user.id)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
