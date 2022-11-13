class BooksController < ApplicationController
  def index
    @books = Book.all
    # need to add the search
    authorize @books
  end

  def show
    @book = Book.find(params[:id])
    @author = Author.new
    authorize @book
    # View.create(producer_id: current_user.id, author_id: @book.author.id)
  end

  def new
    @book = Book.new
    @authors = Author.all
    authorize @book
  end

  def create
    book_params.author_id = book_params.author_id.id
    @book = Book.new(book_params)
    @book.editor = current_user.editor
    authorize @book
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.new
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    book_params.author_id = book_params.author_id.id
    @book.update(book_params)
    authorize @book
    redirect_to book_path(@book)
  end

  def destroy
    @book = book.find(params[:id])
    authorize @book
    @book.destroy
    redirect_to editor_path(current_user.editor)
  end

  private

  def books_params
    params.require(:book).permit(:title, :publishing_year, :summary, :additionnal_description, :genre, :author_id)
  end
end
