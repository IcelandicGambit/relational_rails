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

  def add
    manufacturer = Manufacturer.new({
      name: params[:manufacturer][:name],
      year_founded: params[:manufacturer][:year_founded],
      manufactured_in_us?: params[:manufacturer][:manufactured_in_us?]
      })
    manufacturer.save
    redirect_to '/manufacturers'
  end
end
