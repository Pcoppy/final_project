class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    authorize @author
  end

  def show
    @author = Author.find(params[:id])
    authorize @author
  end

  def create
    @author = Author.new(author_params)
    authorize @author
  end

  def edit
    @author
  end

  private

  def author_params

  end
end
