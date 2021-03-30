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

  it 'I can add a bicycle to a manufactrer' do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
   

    visit "/manufacturers/#{m_1.id}/bicycle_listing"

    click_link 'Add Bicycle'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/bicycle_listing/new")

    fill_in 'model', with: 'Tenner'
    fill_in 'price', with: '1500'
    page.check 'has_rack_mount'
    click_on 'Create Bicycle'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/bicycle_listing")
    expect(page).to have_content('Tenner')
    expect(page).to have_content('1500')
    expect(page).to have_content('true')
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
end