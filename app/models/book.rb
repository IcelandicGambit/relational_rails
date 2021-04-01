class Book < ApplicationRecord
    belongs_to :author

    def self.is_digital
        self.where(digital: :true)
    end

    def self.alphabetize
        order(:title)
    end
end