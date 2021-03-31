require 'rails_helper'

RSpec.describe "bicycles can be created", type: :feature do
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