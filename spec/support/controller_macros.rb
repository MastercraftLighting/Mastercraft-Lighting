module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      create_usertypes
      user = FactoryGirl.create(:user, :admin)
      sign_in user # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      create_usertypes
      user = FactoryGirl.create(:user, :designer)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end

  private

  def create_usertypes
    usertypes= []
    users = ['Designer','ME','Administrator','Lead']
    users.each do |name|
      UserType.create!(name: name)
    end
  end

end
