class AddManufacturersToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_reference :bicycles, :manufacturer, foreign_key: true
  end
end
