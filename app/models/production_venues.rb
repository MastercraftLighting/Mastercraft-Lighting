class ProductionVenues < ActiveRecord::Base

  belongs_to :production
  belongs_to :venue

end
