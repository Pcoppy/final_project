class EditorsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @editors = policy_scope(Editor.all)
  end

  def show
    @editor = Editor.find(params[:id])
    authorize @editor
  end

  def new
    policy_scope(Editor)
    @editor = Editor.new
    authorize @editor
  end

  def create
    policy_scope(Editor)
    @editor = Editor.new(editors_params)
    @editor.email = current_user.email if editors_params[:email] == ""
    authorize @editor
    @editor.user = current_user
    if @editor.save!
      redirect_to new_book_path
    else
      render :new
    end
  end

  def edit
    @editor = Editor.find(params[:id])
    authorize @editor
  end

  def update
    @editor = Editor.find(params[:id])
    @editor.update(editors_params)
    authorize @editor
    redirect_to editor_path(@editor)
  end

  def destroy
    @editor = Editor.find(params[:id])
    authorize @editor
    @editor.destroy
    redirect_to root_path
  end

  private

  def editors_params
    params.require(:editor).permit(:name, :address, :phone_number, :email, :more_info)
  end
end
