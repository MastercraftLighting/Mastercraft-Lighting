class Venue < ActiveRecord::Base
  has_many :equipment, through: :equipment_venues
  has_many :productions, through: :productions_venues
end
