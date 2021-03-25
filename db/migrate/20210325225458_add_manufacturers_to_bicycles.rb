class AddManufacturersToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_reference :bicycles, :manufacturers, foreign_key: true
  end
end
