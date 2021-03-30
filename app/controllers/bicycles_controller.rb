class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.all
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def new
    @manufacturer= Manufacturer.find(params[:id])
  end

  def create
    
    manufacturer= Manufacturer.find(params[:id])
    manufacturer.bicycles.create(bicycle_params)
    redirect_to "/manufacturers/#{manufacturer.id}/bicycle_listing"
  end

  private
  def bicycle_params
    params.permit(:model, :price, :has_rack_mount)
  end
end
