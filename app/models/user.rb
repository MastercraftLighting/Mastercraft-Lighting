class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :leads
  has_many :production_leads, through: :leads, foreign_key: :user_id
  has_many :production_designer, foreign_key: :designer_id, class_name: "Production"
  has_many :production_electrician, foreign_key: :master_electrician_id, class_name: "Production"
end
