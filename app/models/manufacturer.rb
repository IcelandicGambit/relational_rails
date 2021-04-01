class Manufacturer < ApplicationRecord
  has_many :bicycles

  def count_by_manufacturer
    bicycles.count
  end
  
  def self.order_by_created
    self.order('created_at DESC')
  end
end
