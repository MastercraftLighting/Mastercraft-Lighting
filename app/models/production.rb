class Production < ActiveRecord::Base

  has_and_belongs_to_many :venues
  has_many :equipments
  has_many :leads
  has_many :users, through: :leads
  belongs_to :designer, class_name: "User"
  belongs_to :master_electrician, class_name: "User"
  accepts_nested_attributes_for :equipments
end
