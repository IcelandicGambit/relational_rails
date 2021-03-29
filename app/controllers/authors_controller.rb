class AuthorsController < ApplicationController
    def index
        @authors = Author.all.order('created_at DESC')
    end

    def show
        @author = Author.find(params[:id])
    end

    def book_listing
        @author = Author.find(params[:id])
        @book_listing = Book.where(author_id: params[:id])
    end

    def add
        manufacturer = Manufacturer.new({
            name: params[:author][:name],
            age: params[:author][:age],
            is_alive?: params[:author][:is_alive?]x
            })
        author.save
        redirect_to '/authors'
    end
end

