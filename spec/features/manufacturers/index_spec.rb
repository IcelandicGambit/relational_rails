require 'rails_helper'

RSpec.describe "manufacturers index", type: :feature do
  it "can see all manufacturers" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)

    visit "/manufacturers"

    expect(page).to have_content(m_1.name)
    expect(page).to have_content(m_2.name)
  end
  
  it 'can update a manufacturer' do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)

    visit '/manufacturers'

    click_link 'Edit'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/edit")

    fill_in 'Name', with: 'Tenner'
    click_on 'Update Manufacturer'

    expect(current_path).to eq("/manufacturers")
    expect(page).to have_content('Tenner')
  end

  it "can see sorted bicycles" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
    b_3 = m_1.bicycles.create!(model: "Rove Ti", price: 1811, has_rack_mount: true)

    visit "/manufacturers/#{m_1.id}/bicycle_listing"
    click_link 'Sort'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/bicycle_listing/sorted")
    expect(page).to have_content(b_1.model)
    expect(page).to have_content(b_1.price)
    expect(page).to have_content(b_1.has_rack_mount)
    expect(page).to have_content(b_3.model)
    expect(page).to have_content(b_3.price)
    expect(page).to have_content(b_3.has_rack_mount)
  end
end
