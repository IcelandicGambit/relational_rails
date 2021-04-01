require 'rails_helper'

RSpec.describe "manufacturers index", type: :feature do
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