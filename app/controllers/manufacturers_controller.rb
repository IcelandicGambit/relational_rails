class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    #binding.pry
    @manufacturer = Manufacturer.find(params[:id])
  end
end