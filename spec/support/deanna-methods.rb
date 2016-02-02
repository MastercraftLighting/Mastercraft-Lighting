def login_as_admin
  admin = User.create!(FactoryGirl.attributes_for :user, :admin)
  visit '/'
  click_link("Login")
  fill_in "Email", :with => "user@user.com"
  fill_in "Password", :with => "password"
  click_button('Log in')
end

def login_as_designer
  @user = User.create!(FactoryGirl.attributes_for :user, :designer)
  visit '/'
  click_link("Login")
  fill_in "Email", :with => "user@user.com"
  fill_in "Password", :with => "password"
  click_button('Log in')
  visit "/"
end

def create_show_for_designer
  @production = Production.new(FactoryGirl.attributes_for :production)
  @production.designer = @user
  @production.save
end
