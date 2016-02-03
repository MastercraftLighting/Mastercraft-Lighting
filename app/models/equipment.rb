class Equipment < ActiveRecord::Base
  belongs_to :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes
  has_many :accessories

  def self.import(csv)
    Equipment.create(csv)
  end

  def accessories_list
    result = String.new
    self.accessories.each do |accessory|
      result += accessory.instrument_type + ","
    end
    result.slice!(-1)
    result
  end

  # This is extremely fragile.  Users have to enter their equipment name in exactly the expected format to get a match
  before_save do
    if self.instrument_type.slice(-3,3) == "deg"
      puts "this is self:"
      p self
      unit_name = self.instrument_type.slice(0..-7)
      puts "this is unit_name"
      p unit_name
      beam_angle = self.instrument_type.slice(-5,2)
      puts "this is beam_angle"
      p beam_angle
      lookup_instrument = UnitLibrary.find_by(unit_name: unit_name, beam_angle: beam_angle)
      puts "this is lookup_instrument"
      p lookup_instrument
      if (self.frame_size == nil || self.frame_size == "") && lookup_instrument
        self.frame_size = lookup_instrument.frame_size || ""
      end
    else
      unit_name = self.instrument_type
      lookup_instrument = UnitLibrary.find_by(unit_name: unit_name)
      if (self.frame_size == nil || self.frame_size == "") && lookup_instrument
        self.frame_size = lookup_instrument.frame_size || ""
      end
    end
  end

end
