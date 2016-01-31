class CreateColorLibraries < ActiveRecord::Migration
  def change
    create_table :color_libraries do |t|
      t.string :full_name
      t.string :alias1
      t.string :alias2
      t.string :description
      t.float :transmission
      t.string :hex_code
      t.timestamps null: false
    end
  end
end
