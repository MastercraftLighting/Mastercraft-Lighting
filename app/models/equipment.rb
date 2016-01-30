class Equipment < ActiveRecord::Base
  has_many :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes
end
