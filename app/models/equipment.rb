class Equipment < ActiveRecord::Base
  belongs_to :production
  belongs_to :venue, through: :equipment_venues
  has_many :equipment_notes
end
