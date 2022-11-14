class AuthorPolicy < ApplicationPolicy

  def show?
    user.subscription != "none" || (record.books & user.editor.books) != []
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
