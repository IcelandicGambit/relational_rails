class ChangeManufacturerBooleanName < ActiveRecord::Migration[5.2]
  def change
    rename_column :manufacturers, :manufactured_in_us?, :manufactured_in_us
  end
end
