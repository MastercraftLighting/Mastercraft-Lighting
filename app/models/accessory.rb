class Accessory < ActiveRecord::Base
  belongs_to :equipment

  def self.import(csv)
    item = self.create(csv)
  end

end
