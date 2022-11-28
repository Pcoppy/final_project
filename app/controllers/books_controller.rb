class BooksController < ApplicationController
  def index
    # need to add the search
    if params[:query].present?
      @books = policy_scope(Book.search_antyhing("%#{params[:query]}%"))
      @search_is_on = true
      @search_terms = params[:query]
    else
      @books = policy_scope(Book).order(views_count: :desc)
      @search_is_on = false
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
    return if view_test_variable[0].to_i == current_user.id && (Time.now - view_test_variable[1].to_time).to_i <= 3600

    @book.add_to_views_count("#{current_user.id} - #{Time.now}")
  end

  def new
    policy_scope(Book)
    @book = Book.new
    @authors = policy_scope(Author.all)
    authorize @book
    redirect_to new_user_editor_path(current_user.id) if current_user.editor.nil?
  end

  def create
    # books_params.author_id = books_params.author_id.id
    policy_scope(Book)
    # books_params[:tags] = books_params[:tags].compact_blank
    @book = Book.new(books_params)
    @book.tags = @book.tags.compact_blank
    @book.editor = current_user.editor
    @book.approved = true # THIS LINE WILL NEED TO BE REMOVED
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
    books_params.author_id = books_params.author_id.id
    @book.update(books_params)
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
    params.require(:book).permit(:title, :publishing_year, :summary, :additionnal_description, :genre, :author_id, tags: [])
  end
end
