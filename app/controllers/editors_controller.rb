class EditorsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @editors = Editor.all
  end

  def show
    @editor = Editor.find(params[:id])
    authorize @editor
  end

  def new
    @editor = Editor.new
    authorize @editor
  end

  def create
    @editor = Editor.new(editors_params)
    @editor.user = current_user
    authorize @editor
    if @editor.save
      redirect_to editor_path(@editor)
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
    params.require(:editor).permit(:name, :country, :address)
  end
end
