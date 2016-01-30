class Lead < ActiveRecord::Base

  belongs_to :user
  belongs_to :production

end
