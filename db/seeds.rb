# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Seed User table
users = [{username: 'Sparky15', email: "Sparky15@email.com", password: 'lights1234', user_type: 'Designer'},
         {username: 'FoxyFox', email: "FoxyFox@email.com", password: 'grayfox1234', user_type: 'ME'},
         {username: 'Adam', email: "Adam@email.com", password: 'password1234', user_type: 'Administrator'},
         {username: 'LarryLighter', email: "LarryLighter@email.com", password: '12341234', user_type: 'Designer'},
         {username: 'JerryCrew', email: "JerryCrew@email.com", password: 'monkey1234', user_type: 'Lead'},
         {username: 'JohnCrew', email: "JohnCrew@email.com", password: 'banana1234', user_type: 'Lead'}]

users.each do |user|
  User.create(user)
end

# Seed Venue Table
venues = [{name: 'Shotgun Players', address: 'Berkeley, CA'},
          {name: 'SFBallet', address: 'San Francisco, CA'},
          {name: 'Orb Theatre', address: 'Richmond, CA'}]

venues.each do |venue|
  Venue.create(venue)
end

# Seed Production Table
productions = [{name: 'BatBoy', date: Date.today, designer_id: 1, master_electrician_id: 2},
               {name: 'Phantom of the Opera', date: Date.today, designer_id: 3, master_electrician_id: 4},
               {name: 'Wicked', date: Date.today, designer_id: 5, master_electrician_id: 6}]

productions.each do |production|
  Production.create(production)
end

# Production/Venue connection table??

# Equipment Seed Table
equipment = [{instrument_type: "Source 4 26deg", wattage: 575, purpose: "Fronts", position: "FOH 1",
              unit_number: 1, color: "R60", dimmer: 10, channel: 1, address: 4, universe: 1,
              circuit_number: 1, circuit_name: "A", production_id: 1},
             {instrument_type: "Source 4 26deg", wattage: 575, purpose: "Fronts", position: "FOH 1",
              unit_number: 2, color: "R60", dimmer: 8, channel: 2, address: 2, universe: 1,
              circuit_number: 2, circuit_name: "A", production_id: 1},
             {instrument_type: "Source 4 19deg", wattage: 575, purpose: "E's Special", position: "FOH 2",
              unit_number: 1, color: "R33", dimmer: 6, channel: 3, address: 5, universe: 1,
              circuit_number: 3, circuit_name: "A", production_id: 1},
             {instrument_type: "Source 4 26deg", wattage: 575, purpose: "Fronts", position: "FOH 1",
              unit_number: 3, color: "R60", dimmer: 4, channel: 4, address: 6, universe: 1,
              circuit_number: 4, circuit_name: "A", production_id: 1},
             {instrument_type: "Source 4 26deg", wattage: 575, purpose: "Fronts", position: "FOH 1",
              unit_number: 4, color: "R60", dimmer: 2, channel: 5, address: 1, universe: 1,
              circuit_number: 5, circuit_name: "A", production_id: 1},
             {instrument_type: "Source 4 10deg", wattage: 575, purpose: "Center Spot", position: "E1",
              unit_number: 3, color: "R08", dimmer: 23, channel: 13, address: 17, universe: 1,
              circuit_number: 1, circuit_name: "C", production_id: 1},
             {instrument_type: "Source 4 36deg", wattage: 575, purpose: "Backs", position: "E1",
              unit_number: 4, color: "L079", dimmer: 24, channel: 14, address: 12, universe: 1,
              circuit_number: 3, circuit_name: "C", production_id: 1},
             {instrument_type: "Source 4 36deg", wattage: 575, purpose: "Backs", position: "E1",
              unit_number: 5, color: "L079", dimmer: 25, channel: 15, address: 11, universe: 1,
              circuit_number: 5, circuit_name: "C", production_id: 1},
             {instrument_type: "Source 4 36deg", wattage: 575, purpose: "Backs", position: "E1",
              unit_number: 1, color: "L079", dimmer: 21, channel: 11, address:15, universe: 1,
              circuit_number: 1, circuit_name: "B", production_id: 1},
             {instrument_type: "Source 4 36deg", wattage: 575, purpose: "Backs", position: "E1",
              unit_number: 2, color: "L079", dimmer: 22, channel: 12, address: 14, universe: 1,
              circuit_number: 2, circuit_name: "B", production_id: 1}]

equipment.each do |piece|
  Equipment.create(piece)
end

equipment_notes = [{note: "This is a note on LightingRig1", equipment_id: 1, field_type: "instrument_type"},
                   {note: "This is a note on LightingRig2", equipment_id: 2, field_type: "instrument_type"},
                   {note: "This is a note on LightingRig3", equipment_id: 3, field_type: "instrument_type"}]

equipment_notes.each do |note|
  EquipmentNote.create(note)
end

# Production Venue values
batboy = Production.find_by(name: "BatBoy")
phantom = Production.find_by(name: "Phantom of the Opera")
wicked = Production.find_by(name: "Wicked")
shotgun = Venue.find_by(name: "Shotgun Players")
ballet = Venue.find_by(name: "SFBallet")
orb = Venue.find_by(name: "Orb Theatre")

batboy.venues << shotgun
phantom.venues << ballet
wicked.venues << orb

# Equipment Venue values

equip1 = Equipment.find_by(instrument_type: "Source 4 36deg")
equip2 = Equipment.find_by(instrument_type: "Source 4 26deg")
equip3 = Equipment.find_by(instrument_type: "Source 4 10deg")
# venue values from above

shotgun.equipment << equip1
ballet.equipment << equip2
orb.equipment << equip3
