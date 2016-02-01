class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.text :instrument_type
      t.integer :wattage
      t.text :purpose
      t.text :position, default: 0
      t.text :unit_number
      t.text :color
      t.integer :dimmer, default: 0
      t.integer :channel, default: 0
      t.integer :address
      t.text :universe
      t.integer :circuit_number, default: 0
      t.text :circuit_name, default: "!"
      t.float :frame_size
      t.text :gobo_1
      t.text :gobo_2
      t.text :focus
      t.text :accessories
      t.integer :production_id
      t.timestamps null: false
    end
  end
end
