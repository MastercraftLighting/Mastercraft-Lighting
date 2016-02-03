class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :leads
  has_many :lead_productions, through: :leads, source: "user"
  has_many :designed_productions, foreign_key: :designer_id, class_name: "Production"
  has_many :master_electrician_productions, foreign_key: :master_electrician_id, class_name: "Production"
  belongs_to :user_type

end
