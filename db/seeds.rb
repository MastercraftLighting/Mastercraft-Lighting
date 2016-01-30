# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CsvInput.create()

User.create(
      email: "butt@monkey.com"
      password:"password"
      user_type: "0"
      username: "Buttmonkey"
)

EquipmentNote.create(
      t.text :note: ""
      t.integer :equipment_id, null: false
      t.string :field_type, null: false
)

Equipment.create(
      t.integer :production_id, null: false
)

Lead.create(
      t.integer :production_id, null: false
      t.integer :user_id, null: false
)

ProductionVenue.create(
      t.integer :venue_id, null: false
      t.integer :production_id, null: false
)

EquipmentVenue.create(
      t.integer :equipment_id, null: false
      t.integer :venue_id, null: false
)

Production.create(
      t.string :name, null: false
)

Venue.create(
      t.string :name, null: false
)
