class CreateEquipmentVenues < ActiveRecord::Migration
  def change
    create_table :equipment_venues do |t|
      t.integer :equipment_id
      t.integer :venue_id
    end
  end
end

