require 'rails_helper'

RSpec.describe "manufacturers index", type: :feature do
  it "can see all manufacturers" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)

    visit "/manufacturers"

    expect(page).to have_content(m_1.name)
    expect(page).to have_content(m_2.name)
  end
  it 'It has header links ' do
    
    visit "/bicycles"

    click_link 'All Manufacturers'

    expect(current_path).to eq("/manufacturers")

    visit "/bicycles"
    click_link 'All Bicycles'
    expect(current_path).to eq("/bicycles")
  end
  it "can delete a manufacturer" do
    m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
    
    
    visit "/manufacturers/"

    expect(page).to have_content(m_1.name)
    
    click_on 'Delete'

    expect(current_path).to eq("/manufacturers")
    expect(page).should have_no_content(m_1.name)
  end
  
end
