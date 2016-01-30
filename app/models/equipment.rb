class Equipment < ActiveRecord::Base
  belongs_to :production
  # has many below should probably be a belongs_to but it was complaining because of through which
  # we need because of it belonging to both production and venues
  has_many :venue, through: :equipment_venues
  has_many :equipment_notes
end
