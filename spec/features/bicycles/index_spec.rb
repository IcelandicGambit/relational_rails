require 'rails_helper'

RSpec.describe "bicycles index", type: :feature do
  it "can see all bicycles" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: true)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)

    visit "/bicycles"

    expect(page).to have_content(b_1.model)
    expect(page).to have_content(m_1.name)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)
    expect(page).should have_no_content(b_2.model)
    expect(page).should have_no_content(m_2.name)
    expect(page).should have_no_content(b_2.price)
    expect(page).should have_no_content(b_2.has_rack_mount)
  end
  it 'It has header links ' do
    
    visit "/bicycles"

    click_link 'All Manufacturers'

    expect(current_path).to eq("/manufacturers")

    visit "/bicycles"
    click_link 'All Bicycles'
    expect(current_path).to eq("/bicycles")
  end
  it 'I can edit a bicycle ' do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: false)
   

    visit "/bicycles/#{b_1.id}"

    click_link 'Edit'

    expect(current_path).to eq("/bicycles/#{b_1.id}/edit")

    fill_in 'model', with: 'Tenner'
    fill_in 'price', with: '1400'
    page.check 'has_rack_mount'
    click_on 'Update Bicycle'

    expect(current_path).to eq("/bicycles/#{b_1.id}")
    expect(page).to have_content('Tenner')
    expect(page).to have_content('1400')
    expect(page).to have_content('true')
  end
  it "can delete a bicycle" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    
    visit "/bicycles/"

    expect(page).to have_content(b_1.model)
    expect(page).to have_content(m_1.name)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)

    click_on 'Delete'

    expect(current_path).to eq("/bicycles")
    expect(page).should have_no_content(b_1.model)
    expect(page).should have_no_content(b_1.price)
    expect(page).should have_no_content(b_1.has_rack_mount)
  end
end
