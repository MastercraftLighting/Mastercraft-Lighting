class CreateProductionsVenues < ActiveRecord::Migration
  def change
    create_table :productions_venues do |t|
      t.integer :venue_id
      t.integer :production_id
    end
  end
end
