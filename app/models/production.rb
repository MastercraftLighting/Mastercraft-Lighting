class Production < ActiveRecord::Base

  has_and_belongs_to_many :venues
  has_many :equipment
  has_many :leads
  has_many :users, through: :leads
  has_one :designer, class_name: "User"
  has_one :master_electrician, class_name: "User"

end
