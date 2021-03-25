class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :year_founded
      t.boolean :manufactured_in_us?
      
      t.timestamps
    end
  end
end
