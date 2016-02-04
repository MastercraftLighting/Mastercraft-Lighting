class CreateProductionVenues < ActiveRecord::Migration
  def change
    create_table :production_venues do |t|
      t.integer :venue_id
      t.integer :production_id
      t.timestamps null: false
      end
  end
end
