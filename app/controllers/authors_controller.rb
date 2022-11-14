class AuthorsController < ApplicationController
  def index
    @authors = policy_scope(Author)
  end

  def show
    @author = policy_scope(Author).find(params[:id])
    authorize @author
  end

  def create
    @author = Author.new(author_params)
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :description)
  end
end
