class Equipment < ActiveRecord::Base
  belongs_to :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes
end
