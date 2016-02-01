# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Seed Usertype table
usertypes= []
users = ['Designer','ME','Administrator','Lead']
users.each do |name|
  Usertype.create!(name: name)
end

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


#-------------------------- UNIT LIBRARY ----------------------------------------

unit_library_entries = [
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '5', frame_size: 14, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '10', frame_size: 12, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '20', frame_size: 6.25, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '30', frame_size: 6.25, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '40', frame_size: 6.25, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: 'Shakespeare', beam_angle: '50', frame_size: 6.25, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR64', beam_angle: 'VNSP', frame_size: 10, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR64', beam_angle: 'NSP', frame_size: 10, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR64', beam_angle: 'MFL', frame_size: 10, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR64', beam_angle: 'WFL', frame_size: 10, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR56', beam_angle: 'VNSP', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR56', beam_angle: 'NSP', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR56', beam_angle: 'MFL', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR56', beam_angle: 'WFL', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR38', beam_angle: 'VNSP', frame_size: 7, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR38', beam_angle: 'NSP', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR38', beam_angle: 'MFL', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "PAR", unit_name: 'PAR38', beam_angle: 'WFL', frame_size: 7.5, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: '3.5Q-5', beam_angle: '48', frame_size: 4.125, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: '3.5Q-6', beam_angle: '38', frame_size: 4.125, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: '3.5Q-8', beam_angle: '28', frame_size: 4.125, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: '3.5Q-10', beam_angle: '23', frame_size: 4.125, c_i: 0},
  {manufacturer: "Altman", unit_type: "Ellipsoidal", unit_name: '3.5Q-12', beam_angle: '18', frame_size: 4.125, c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'EC-1', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'EC-2', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'EC-3', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'FC-1', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'FC-2', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'FC-3', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-1', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-2', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-3', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-4', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-5', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-6', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-7', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-8', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-9', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-10', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-11', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'GC-12', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'SKY-CYC-01', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'SKY-CYC-02H', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'SKY-CYC-02V', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'SKY-CYC-03', c_i: 0},
  {manufacturer: "Altman", unit_type: "Cyc", unit_name: 'SKY-CYC-04', c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "520 3 6'9\"", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "520 3 8'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "520 4 6", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "520 4 7'6\"", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "528 3 6'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "528 3 7'6\"", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "528 4 6'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "528 4 8'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "DF-400 3", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "DF-400 4", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "DF-558 3", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "DF-558 4", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "MicroStrip 1", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "MicroStrip 2", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "MicroStrip 3", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "PAR56 3 Circ 4'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "PAR56 3 Circ 8'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "R40 3 6'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "R40 3 7'6\"", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "R40 4 6'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "R40 4 8'", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "SS Striplight", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "ZS-1", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "ZS-2", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "ZS-3", c_i: 0},
  {manufacturer: "Altman", unit_type: "Strips", unit_name: "ZS-4", c_i: 0},
  {manufacturer: "Altman", unit_type: "Open Face", unit_name: "Q-Lite", c_i: 0},
  {manufacturer: "Altman", unit_type: "Open Face", unit_name: "Q-Lite-Jr", c_i: 0},

  {manufacturer: "Martin", unit_type: "Strobe", unit_name: "Atomic 3K", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250 Beam", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250 Entour", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250 Krypton", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250 Wash", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 250+", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 300", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 301", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 350 Entour", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 401 CT", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 401 Dual", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 401 RGB", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 500", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 550", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 575 Krypton", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 600", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 600NT", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 700 Profile", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 700 Wash", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 1200", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 2000 Beam", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 2000 Wash", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC Aura", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC III AirFX", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC III Performance", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC III Profile", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC III Quadray", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC III Wash", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 2000 Performance", c_i: 1},
  {manufacturer: "Martin", unit_type: "Moving Light", unit_name: "MAC 2000 Profile", c_i: 1},

  {manufacturer: "Generic", unit_type: "Fresnel 3\"", frame_size: 3.75, c_i: 0},
  {manufacturer: "Generic", unit_type: "Fresnel 6\"", frame_size: 7.25, c_i: 0},
  {manufacturer: "Generic", unit_type: "Fresnel 8\"", frame_size: 10, c_i: 0},
  {manufacturer: "Generic", unit_type: "PAR 16", frame_size: 2.875, c_i: 0},

  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "5", frame_size: 14, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "10", frame_size: 12, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "14", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "19", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "26", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "36", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "50", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "70", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4", beam_angle: "90", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4 Jr", beam_angle: "26", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4 Jr", beam_angle: "36", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4 Jr", beam_angle: "50", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "Ellipsoidal", unit_name: "Source 4 Jr", beam_angle: "Zoom", frame_size: 6.25, c_i: 0},
  {manufacturer: "ETC", unit_type: "PAR", unit_name: "Source 4 PAR", beam_angle: "NSP", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "PAR", unit_name: "Source 4 PAR", beam_angle: "MFL", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "PAR", unit_name: "Source 4 PAR", beam_angle: "WFL", frame_size: 7.5, c_i: 0},
  {manufacturer: "ETC", unit_type: "PARNEL", unit_name: "Source 4 PARnel", c_i: 0}
]

unit_library_entries.each do |entry|
  UnitLibrary.create(entry)
end

#-------------------------- END UNIT LIBRARY ------------------------------------
#-------------------------- COLOR LIBRARY ---------------------------------------

color_library_entries = [
  {full_name: "Roscolux #06: No Color Straw", alias1: "R06", alias2: "R-06", description: "Slightly off white. Good for interiors.", transmission: 92, hex_code: "fcfadb"},
  {full_name: "Roscolux #08: Pale Gold", alias1: "R08", alias2: "R-08", description: "Warmer straw. Flattering to skin tones.", transmission: 86, hex_code: "ffe0b8"},
  {full_name: "Roscolux #33: No Color Pink", alias1: "R33", alias2: "R-33", description: "A pale almost colorless pink.", transmission: 65, hex_code: "ffc2d0"},
  {full_name: "Roscolux #60: No Color Blue", alias1: "R60", alias2: "R-60", description: "Helps maintain white light when dimmer is at low intensity.", transmission: 62, hex_code: "ccd8ff"},
  {full_name: "Lee #200: Double CT Blue", alias1: "L200", alias2: "L-200", description: "Converts 3200K to 26000K", transmission: 16.2, hex_code: "91bef5"},
  {full_name: "Lee #079: Just Blue", alias1: "L079", alias2: "L-079", description: "A good color mixing blue. Great for cyclorama lighting", transmission: 5.6, hex_code: "3C8CD2"}
]

color_library_entries.each do |entry|
  ColorLibrary.create(entry)
end

#-------------------------- END COLOR LIBRARY -----------------------------------
