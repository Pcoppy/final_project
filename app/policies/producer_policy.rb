class ProducerPolicy < ApplicationPolicy
  def show?
    record.user == user || (record.wishlist & user.books) != []
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def new?
    user.subscription != "none" && !user.producer
  end

  def create?
    user.subscription != "none" && !user.producer
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
