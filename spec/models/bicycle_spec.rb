require 'rails_helper'

describe Bicycle, type: :model do
  describe 'relationships' do
    it { belong_to :manufacturers }
  end
end