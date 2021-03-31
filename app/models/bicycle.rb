class Bicycle < ApplicationRecord
  belongs_to :manufacturer

  def self.has_rack
    where(has_rack_mount: :true)
  end
end