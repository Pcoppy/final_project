class BooksController < ApplicationController
  def index
    # need to add the search
    if params[:query].present?
      sql_query = <<~SQL
        books.title ILIKE :query
        OR books.genre ILIKE :query
        OR authors.first_name ILIKE :query
        OR authors.last_name ILIKE :query
      SQL
      @books = policy_scope(Book.joins(:author).where(sql_query, query: "%#{params[:query]}%"))
    else
      @books = policy_scope(Book).order(views_count: :desc)
    end
    authorize @books
  end

  def show
    @book = policy_scope(Book).find(params[:id])
    @author = Author.new
    authorize @book
    # Changing the view count
    if @book.views_count.size.zero?
      @book.add_to_views_count("#{current_user.id} - #{Time.now}")
      return
    end

    view_test_variable = @book.views_count.last.split(' - ')
    return if view_test_variable[0].to_i == current_user.id && (view_test_variable[1].to_time - Time.now).to_i <= 3600

    @book.add_to_views_count("#{current_user.id} - #{Time.now}")
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
