require 'rails_helper'

describe Author, type: :model do
  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'instance methods' do
    describe 'count_books' do
      it 'number of books associated with author' do
         a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
         a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
         b_1 = a_1.books.create!(title: "Understanding Power", number_of_pages: 416, digital: false)
         b_2 = a_1.books.create!(title: "Manufacturing Consent", number_of_pages: 480, digital: false)
         b_3 = a_2.books.create!(title: "Ulysses", number_of_pages: 730, digital: true)

         expect(a_1.count_books).to eq(2)
         expect(a_2.count_books).to eq(1)
      end
    end
  end
end