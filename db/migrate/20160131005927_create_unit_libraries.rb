class CreateUnitLibraries < ActiveRecord::Migration
  def change
    create_table :unit_libraries do |t|
      t.string :manufacturer
      t.string :unit_type
      t.string :unit_name
      t.string :beam_angle
      t.float :frame_size
      t.integer :c_i
      # c_i : 0 = conventional, 1 = intelligent
      t.timestamps null: false
    end
  end
end
