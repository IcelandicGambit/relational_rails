class Bicycle < ApplicationRecord
  belongs_to :manufacturer

  def self.has_rack
    self.where(has_rack_mount: :true)
  end
end