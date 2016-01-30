class CreateEquipmentNotes < ActiveRecord::Migration
  def change
    create_table :equipment_notes do |t|
      t.text :note, null: false
      t.integer :equipment_id, null: false
      t.string :field_type, null: false
      t.timestamps null: false
    end
  end
end
