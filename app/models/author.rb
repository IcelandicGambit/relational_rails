class Author < ApplicationRecord
    has_many :books

    def count_books
        books.count
    end
end
