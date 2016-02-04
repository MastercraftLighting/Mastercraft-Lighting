class Equipment < ActiveRecord::Base
  belongs_to :production
  has_and_belongs_to_many :venues
  has_many :equipment_notes
  has_many :accessories

  INSTRUMENT_TYPE = Equipment.uniq.pluck(:instrument_type)

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

end
