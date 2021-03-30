require 'rails_helper'

RSpec.describe "bicycles views", type: :feature do
  it "can see all bicycles" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)

    visit "/bicycles"

    expect(page).to have_content(b_1.model)
    expect(page).to have_content(m_1.name)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)
    expect(page).to have_content(b_2.model)
    expect(page).to have_content(m_2.name)
    expect(page).to have_content(b_2.price)
    expect(page).to have_content(b_2.has_rack_mount)
  end

  it "can see details of a bicycle" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)
    

    visit "/bicycles/#{b_1.id}"

    expect(page).to have_content(b_1.model)
    expect(page).to have_content(m_1.name)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)
    
    visit "/bicycles/#{b_2.id}"
    expect(page).to have_content(b_2.model)
    expect(page).to have_content(m_2.name)
    expect(page).to have_content(b_2.price)
    expect(page).to have_content(b_2.has_rack_mount)
  end
end