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
end
