class BooksController < ApplicationController
  def index
    @books = Book.all.is_digital
  end

  def show
     @books = Book.find(params[:id])
  end

  def new
    @author = Author.find(params[:id])
  end

  def create

    author = Author.find(params[:id])
    author.books.create(book_params)
    redirect_to "/authors/#{author.id}/book_listing"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to "/books/#{@book.id}"
  end

  private
  def book_params
    params.permit(:title, :number_of_pages, :digital)
  end
end
