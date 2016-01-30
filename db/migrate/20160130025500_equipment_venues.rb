class EquipmentVenues < ActiveRecord::Migration
  def change
    create_table :equipment_venues do |t|
      t.integer :equipment_id, null: false
      t.integer :venue_id, null: false
      t.timestamps null: false
    end
  end
end
