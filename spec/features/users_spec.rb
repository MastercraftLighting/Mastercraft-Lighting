require 'rails_helper'

feature "Users", :type => :feature do

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

  describe "Admin user" do
    it "can log in" do
      login_as_admin
      expect(page).to have_link("Logout")
    end
    it "can view other users" do
      login_as_admin
      visit "/admins"
      expect(page).to have_link("Logout")
    end
    it "is not given the option to create a new show" do
      login_as_admin
      expect(page).to have_no_content("Create a new show")
    end
    it "does not have a link to their shows(that don't exist!)" do
      login_as_admin
      expect(page).to have_no_content("Your Shows")
    end
    it "can log out" do
      login_as_admin
      expect(page).to have_link("Logout")
      click_link("Logout")
      expect(page).to have_link("Login")
    end
  end

  describe "Designer user" do
    it "can log in" do
      login_as_designer
      expect(page).to have_link("Logout")
    end
    it "is given the option to create a new show" do
      login_as_designer
      expect(page).to have_content("Create a new show")
    end
    it "is given the option to view their created shows" do
      login_as_designer
      expect(page).to have_content("Your Shows")
    end
    it "can update their information" do
      login_as_designer
      expect(page).to have_content("Update registration")
    end
    it "can log out" do
      login_as_designer
      expect(page).to have_link("Logout")
      click_link("Logout")
      expect(page).to have_link("Login")
    end
  end

end
