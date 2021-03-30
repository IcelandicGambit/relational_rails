require 'rails_helper'

RSpec.describe "manufacturers views", type: :feature do
  it "can see all manufacturers" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)

    visit "/manufacturers"

    expect(page).to have_content(m_1.name)
    expect(page).to have_content(m_2.name)
  end

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


  it 'I can create a new manufacturers' do

    visit '/manufacturers'

    click_link 'New Manufacturer'

    expect(current_path).to eq('/manufacturers/new')

    fill_in 'Name', with: 'Megan'
    fill_in 'year_founded', with: '1922'
    page.check 'Manufactured in us'
    click_on 'Create Manufacturer'

    expect(current_path).to eq("/manufacturers")
    expect(page).to have_content('Megan')
  end

    it 'I can update a manufacturer' do
      m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)

      visit '/manufacturers'

      click_link 'Edit'

      expect(current_path).to eq("/manufacturers/#{m_1.id}/edit")

      fill_in 'Name', with: 'Tenner'
      click_on 'Update Manufacturer'

      expect(current_path).to eq("/manufacturers")
      expect(page).to have_content('Tenner')
    end
end
