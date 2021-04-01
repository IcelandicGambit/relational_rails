class AuthorsController < ApplicationController
    def index
        @authors = Author.all.order('created_at DESC')
    end

    def show
        @author = Author.find(params[:id])
    end

    def book_listing
        @author = Author.find(params[:id])
        if params[:sort] == "title"
          @book_listing = @author.books.alphabetize
        else
            @book_listing = @author.books
        end  
    end

    def create
        author = Author.new({
            name: params[:author][:name],
            age: params[:author][:age],
            is_alive: params[:author][:is_alive]
            })
        author.save
        redirect_to '/authors'
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
       @author = Author.find(params[:id])
       @author.update(author_params)
       redirect_to '/authors'
    end

    def destroy
        @author = Author.find(params[:id])
        @author.books.each do |book|
            book.destroy
        end
        @author.destroy
        redirect_to '/authors'
    end

    private
    def author_params
        params.permit(:name, :age, :is_alive)
    end
end

