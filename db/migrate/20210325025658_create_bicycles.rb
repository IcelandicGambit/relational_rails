class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :model
      t.integer :price
      t.boolean :has_rack_mount
      
      t.timestamps
    end
  end
end
