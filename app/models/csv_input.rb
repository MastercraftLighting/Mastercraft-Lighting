class CsvInput < ActiveRecord::Base
  after_create :infer_equipment

  #method to generate rows on equipment table goes here
  private
    def infer_equipment
      Equipment.create(instrument_type: self.instrument_type,
         wattage: self.wattage,
         purpose: self.purpose,
         position: self.position,
         unit_number: self.unit_number,
         color: self.color,
         dimmer: self.dimmer,
         channel: self.channel,
         address: self.address,
         universe: self.universe,
         circuit_number: self.circuit_number,
         circuit_name: self.circuit_name,
         frame_size: self.frame_size,
         gobo_1: self.gobo_1,
         gobo_2: self.gobo_2,
         focus: self.focus,
         accessories: self.accessories
         #production_id: self.production_id
         #will need done elsewhere, possibly returning the data to a view
         )
    end

end
