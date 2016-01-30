class EquipmentVenues < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :venue
end
