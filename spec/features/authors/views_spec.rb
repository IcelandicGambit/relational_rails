require 'rails_helper'

RSpec.describe "authors views", type: :feature do
  it "can see all authors" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)

    visit "/authors"

    expect(page).to have_content(a_1.name)
    expect(page).to have_content(a_2.name)
  end

  it "can see attributes of an author" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
    visit "/authors/#{a_1.id}"

    expect(page).to have_content(a_1.name)
    expect(page).to have_content(a_1.age)
    expect(page).to have_content(a_1.is_alive?)
    
    visit "/authors/#{a_2.id}"
    expect(page).to have_content(a_2.name)
    expect(page).to have_content(a_2.age)
    expect(page).to have_content(a_2.is_alive?)
  end

  it "can see all books written by author" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
    b_1 = a_1.books.create!(title: "Understanding Power", number_of_pages: 416, digital: false)
    b_2 = a_1.books.create!(title: "Manufacturing Consent", number_of_pages: 480, digital: false)
    b_3 = a_2.books.create!(title: "Ulysses", number_of_pages: 730, digital: true)

    visit "/authors/#{a_1.id}/book_listing"

    expect(page).to have_content(b_1.title)
    expect(page).to have_content(b_1.number_of_pages)
    expect(page).to have_content(b_1.digital)
    expect(page).to have_content(b_2.title)
    expect(page).to have_content(b_2.number_of_pages)
    expect(page).to have_content(b_2.digital)

    visit "/authors/#{a_2.id}/book_listing"
    expect(page).to have_content(b_3.title)
    expect(page).to have_content(b_3.number_of_pages)
    expect(page).to have_content(b_3.digital)
   
  end

  it "it can display book count" do
    a_1 = Author.create!(name: "Noam Chomsky", age: 92, is_alive?: true)
    a_2 = Author.create!(name: "James Joyce", age: 58   , is_alive?: false)
    b_1 = a_1.books.create!(title: "Understanding Power", number_of_pages: 416, digital: false)
    b_2 = a_1.books.create!(title: "Manufacturing Consent", number_of_pages: 480, digital: false)
    b_3 = a_2.books.create!(title: "Ulysses", number_of_pages: 730, digital: true)

    visit "/authors/#{a_1.id}/book_listing"

    expect(page).to have_content(b_1.title)
    expect(page).to have_content(b_1.number_of_pages)
    expect(page).to have_content(b_1.digital)
    expect(page).to have_content(b_1.count_books)
    expect(page).to have_content(b_2.title)
    expect(page).to have_content(b_2.number_of_pages)
    expect(page).to have_content(b_2.digital)
    expect(page).to have_content(b_2.count_books)

    visit "/authors/#{a_2.id}/book_listing"
    expect(page).to have_content(b_3.title)
    expect(page).to have_content(b_3.number_of_pages)
    expect(page).to have_content(b_3.digital)
  end


end
