require 'rails_helper'

RSpec.describe "manufacturers show", type: :feature do
  it "can see details of a manufacturer" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)

    visit "/manufacturers/#{m_1.id}"

    expect(page).to have_content(m_1.name)
    expect(page).to have_content(m_1.year_founded)
    expect(page).to have_content(m_1.manufactured_in_us)
    
    visit "/manufacturers/#{m_2.id}"
    expect(page).to have_content(m_2.name)
    expect(page).to have_content(m_2.year_founded)
    expect(page).to have_content(m_2.manufactured_in_us)
  end
  
  it "it can display counted bicycles" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)
    b_3 = m_1.bicycles.create!(model: "Rove Ti", price: 1811, has_rack_mount: true)
    b_4 = m_2.bicycles.create!(model: "Coiler", price: 1211, has_rack_mount: false)

    visit "/manufacturers/#{m_1.id}"

    expect(page).to have_content(m_1.name)
    expect(page).to have_content(m_1.year_founded)
    expect(page).to have_content(m_1.manufactured_in_us)
    expect(page).to have_content(m_1.count_by_manufacturer)
    
    visit "/manufacturers/#{m_2.id}"
    expect(page).to have_content(m_2.name)
    expect(page).to have_content(m_2.year_founded)
    expect(page).to have_content(m_2.manufactured_in_us)
    expect(page).to have_content(m_2.count_by_manufacturer)
  end
end