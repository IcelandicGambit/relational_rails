class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    # require 'pry';binding.pry
     @books = Book.find(params[:id])
  end
end
