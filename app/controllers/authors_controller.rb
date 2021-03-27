class AuthorsController < ApplicationController
    def index
        @authors = Author.all.order('created_at DESC')
    end

    def show
        @author = Author.find(params[:id])
    end

    def book_listing
        @book_listing = Book.where(author_id: params[:id])
    end
end

