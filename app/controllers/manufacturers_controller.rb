class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all.order('created_at DESC')
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def bicycle_listing
    @manufacturer = Manufacturer.find(params[:id])
    @bike_listing = Bicycle.where(manufacturer_id: params[:id])
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
  
  private
  def manufacturer_params
    params.permit(:name, :year_founded, :manufactured_in_us)
  end
end
