class ProducersController < ApplicationController
  def new
    @producer = Producer.new
    authorize @producer
  end

  def create
    @user = current_user
    @producer = Producer.new(producer_params)
    @producer.user = @user
    authorize @producer
    if @producer.save
      redirect_to producer_path(@producer)
    else
      redirect_to root_path
    end
  end

  def edit
    @producer = Producer.find(params[:id])
    authorize @producer
  end

  def update
    @producer = Producer.find(params[:id])
    authorize @producer
    @producer.update(producer_params)
    redirect_to producer_path
  end

  def destroy
    @producer = Producer.find(params[:id])
    authorize @producer
    @producer.destroy
    redirect_to root_path
  end

  private

  def producer_params
    params.require(:producer).permit(:name, :company, :interests)
  end
end
