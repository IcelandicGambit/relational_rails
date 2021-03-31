require 'rails_helper'

RSpec.describe "bicycles can be created", type: :feature do
  it 'I can add a bicycle to a manufactrer' do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
   

    visit "/manufacturers/#{m_1.id}/bicycles"

    click_link 'Add Bicycle'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/bicycles/new")

    fill_in 'model', with: 'Tenner'
    fill_in 'price', with: '1500'
    page.check 'has_rack_mount'
    click_on 'Create Bicycle'

    expect(current_path).to eq("/manufacturers/#{m_1.id}/bicycles")
    expect(page).to have_content('Tenner')
    expect(page).to have_content('1500')
    expect(page).to have_content('true')
  end
end