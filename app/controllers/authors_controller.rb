class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = author.find(params[:id])
    end
end

