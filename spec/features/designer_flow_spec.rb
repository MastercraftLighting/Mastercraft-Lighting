=begin
user can create a new account
user logs in
user creates a production
user views their productions
user views one of their productions
user can edit their productions
user can delete their productions
user can update their information
user can log out
user can delete their account
=end

require 'rails_helper'

feature "Designer Use Flow", :type => :feature do

  def login_as_designer
    @user = User.create!(FactoryGirl.attributes_for :user, :designer)
    visit '/'
    click_link("Login")
    fill_in "Email", :with => "user@user.com"
    fill_in "Password", :with => "password"
    click_button('Log in')
    visit "/"
  end

  context "User does not have account" do
    it "can create a new account"
  end

  #login function is tested in logins and users

  context "User is logged in" do
    it 'is given the option to create a production' do
      login_as_designer
      expect(page).to have_content("Create a new show")
    end
    it "can create a production" do
      login_as_designer
      click_on("Create a new show")
      fill_in "Production Name:", :with => "Show Name"
      fill_in "Production Date:", :with => "02/09/2016"
      click_on("Create Show")
      expect(page).to have_content("Show Name")
    end
    # it "can view a list of their productions" do
    #   login_as_designer
    #   production = FactoryGirl.build()
    it 'can view one of their productions'
    it 'can edit a production'
    it 'can delete a production'
    it 'can update their information'
    it 'can log out'
    it 'can delete their account'
  end

end
