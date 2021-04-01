class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order_by_created
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def bicycles
    @manufacturer = Manufacturer.find(params[:id])
    if params[:sort] == "model"
      @bike_listing = @manufacturer.bicycles.order_alphabetically
    else
      @bike_listing = @manufacturer.bicycles
    end
  end

  def new

  end

  def create
    Manufacturer.create(manufacturer_params)
    redirect_to '/manufacturers'
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])

  end
  def update
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.update(manufacturer_params)
    redirect_to '/manufacturers'
  end

  def destroy

    bicycles= Manufacturer.find(params[:id]).bicycles
    bicycles.each do |bicycle|
      bicycle.destroy
    end
    Manufacturer.destroy(params[:id])
    redirect_to '/manufacturers'
  end

  private
  def manufacturer_params
    params.permit(:name, :year_founded, :manufactured_in_us)
  end
end
