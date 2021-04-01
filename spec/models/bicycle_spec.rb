require 'rails_helper'

describe Bicycle, type: :model do
  describe 'relationships' do
    it { belong_to :manufacturers }
  end
  describe 'class methods' do
    describe 'has_rack' do
      it 'can return bicycles where they have a rack' do
        m_1 = Manufacturer.create!(name: "Niner", year_founded: 1990, manufactured_in_us: true)
        m_2 = Manufacturer.create!(name: "Trek", year_founded: 1922, manufactured_in_us: false)
        b_1 = m_1.bicycles.create!(model: "Wander Lust", price: 1990, has_rack_mount: true)
        b_2 = m_2.bicycles.create!(model: "Bomber", price: 1922, has_rack_mount: false)
        b_3 = m_1.bicycles.create!(model: "Rove Ti", price: 1811, has_rack_mount: true)
        b_4 = m_2.bicycles.create!(model: "Coiler", price: 1211, has_rack_mount: false)
        

        expect(m_1.count_by_manufacturer).to eq(2)
        expect(m_2.count_by_manufacturer).to eq(2)
      end
    end
  end
end