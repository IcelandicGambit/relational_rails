require 'rails_helper'

RSpec.describe "manufacturers index", type: :feature do
  it ' can create a new manufacturers' do

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
end