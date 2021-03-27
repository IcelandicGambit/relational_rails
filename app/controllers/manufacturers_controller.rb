class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def child_listing
    @bike_listing = Bicycle.where(manufacturer_id: params[:id])
  end
end
