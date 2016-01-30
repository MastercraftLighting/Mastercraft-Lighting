# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Seed User table
users = [{username: 'Sparky15', password: 'lights', user_type: 'Designer'},
         {username: 'FoxyFox', password: 'grayfox', user_type: 'ME'},
         {username: 'Adam', password: 'password', user_type: 'Administrator'},
         {username: 'LarryLighter', password: '1234', user_type: 'Designer'},
         {username: 'JerryCrew', password: 'monkey', user_type: 'Lead'},
         {username: 'JohnCrew', password: 'banana', user_type: 'Lead'}]

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
