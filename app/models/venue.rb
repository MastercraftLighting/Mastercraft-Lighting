class Venue < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  has_and_belongs_to_many :productions
end
