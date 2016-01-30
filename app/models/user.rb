class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :leads
  has_many :productions, through: :leads
  has_many :productions, foreign_key: :designer_id
  has_many :productions, foreign_key: :master_electrician_id
end
