class Manufacturer < ApplicationRecord
  has_many :bicycles

  def count_by_manufacturer
    bicycles.count
  end
end
