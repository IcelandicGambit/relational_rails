class Author < ApplicationRecord
    has_many :books
    # validates_presence_of :name, :age, :is_alive

    def count_books
        books.count
    end
end
