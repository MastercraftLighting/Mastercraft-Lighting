class ProductionsVenues < ActiveRecord::Migration
  def change
    create_table :productions_venues do |t|
      t.integer :venue_id, null: false
      t.integer :production_id, null: false
      t.timestamps null: false
    end
  end
end
