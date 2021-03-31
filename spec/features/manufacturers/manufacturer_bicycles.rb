require 'rails_helper'

RSpec.describe "it can see bicycles specific to manufacturer", type: :feature do
  it "can see all bicycles related to manufacturer" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)
    b_3 = m_1.bicycles.create!(model: "Rove Ti", price: 1811, has_rack_mount: true)
    b_4 = m_2.bicycles.create!(model: "Coiler", price: 1211, has_rack_mount: false)

    visit "/manufacturers/#{m_1.id}/bicycle_listing"

    expect(page).to have_content(b_1.model)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)
    expect(page).to have_content(b_3.model)
    expect(page).to have_content(b_3.price)
    expect(page).to have_content(b_3.has_rack_mount)

    visit "/manufacturers/#{m_2.id}/bicycle_listing"
    expect(page).to have_content(b_2.model)
    expect(page).to have_content(b_2.price)
    expect(page).to have_content(b_2.has_rack_mount)
    expect(page).to have_content(b_4.model)
    expect(page).to have_content(b_4.price)
    expect(page).to have_content(b_4.has_rack_mount)
  end
end