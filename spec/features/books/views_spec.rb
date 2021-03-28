require 'rails_helper'

RSpec.describe "book views", type: :feature do
  it "can see all books" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
    b_1 = a_1.books.create!(title: "Understanding Power", number_of_pages: 416, digital: false)
    b_2 = a_2.books.create!(title: "Ulysses", number_of_pages: 730, digital: true)

    visit "/books"

    expect(page).to have_content(b_1.title)
    expect(page).to have_content(a_1.name)
    expect(page).to have_content(b_1.number_of_pages)
    expect(page).to have_content(b_1.digital)
    expect(page).to have_content(b_2.title)
    expect(page).to have_content(a_2.name)
    expect(page).to have_content(b_2.number_of_pages)
    expect(page).to have_content(b_2.digital)
  end

  it "can see attributes of a book" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
    b_1 = a_1.books.create!(title: "Understanding Power", number_of_pages: 416, digital: false)
    b_2 = a_2.books.create!(title: "Ulysses", number_of_pages: 730, digital: true)
    

    visit "/books/#{b_1.id}"

    expect(page).to have_content(b_1.title)
    expect(page).to have_content(a_1.name)
    expect(page).to have_content(b_1.number_of_pages)
    expect(page).to have_content(b_1.digital)
    
    visit "/books/#{b_2.id}"
    expect(page).to have_content(b_2.title)
    expect(page).to have_content(a_2.name)
    expect(page).to have_content(b_2.number_of_pages)
    expect(page).to have_content(b_2.digital)
  end
end