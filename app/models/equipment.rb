class Equipment < ActiveRecord::Base
  belongs_to :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes
  has_many :accessories

  # the INSTRUMENT_TYPE constant is used to provide a list of options for autocompletion when creating a new or editing a piece of equipment. As currently written it only calculates once when the server is loaded, we should change this to a class variable and write a method for the create & update routes in the Equipment controller that add the field value to the list if it does not already exist.

  # INSTRUMENT_TYPE = Equipment.uniq.pluck(:instrument_type)

  @@instrument_types = Equipment.uniq.pluck(:instrument_type)

  def self.instrument_types
    @@instrument_types
  end

  def self.add_instrument_types(instrument)
    @@instrument_types = @@instrument_types | [instrument]
  end

  def self.import(csv)
    Equipment.create(csv)
  end

  def accessories_list
    result = String.new
    self.accessories.each do |accessory|
      result += accessory.instrument_type + ", "
    end
    result.slice!(-2)
    result
  end

  # This is extremely fragile.  Users have to enter their equipment name in exactly the expected format to get a match
  before_save do
    if self.instrument_type.slice(-3,3) == "deg"
      unit_name = self.instrument_type.slice(0..-7)
      beam_angle = self.instrument_type.slice(-5,2)
      lookup_instrument = UnitLibrary.find_by(unit_name: unit_name, beam_angle: beam_angle)
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
