class Equipment < ActiveRecord::Base
  belongs_to :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes

  def self.import(csv)
    item = Equipment.create(
     instrument_type: csv.instrument_type,
     wattage: csv.wattage,
     purpose: csv.purpose,
     position: csv.position,
     unit_number: csv.unit_number,
     color: csv.color,
     dimmer: csv.dimmer,
     channel: csv.channel,
     address: csv.address,
     universe: csv.universe,
     circuit_number: csv.circuit_number,
     circuit_name: csv.circuit_name,
     frame_size: csv.frame_size,
     gobo_1: csv.gobo_1,
     gobo_2: csv.gobo_2,
     focus: csv.focus,
     accessories: csv.accessories,
     production_id: csv.production_id
     )
  end

end
