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

  def create_show_for_designer
    @production = Production.new(FactoryGirl.attributes_for :production)
    @production.designer = @user
    @production.save
  end

  context "User does not have account" do
    xit "can create a new account" do
      #leaving User type on default results in a null value and/or is not being passed in at all
      visit "/"
      click_on("Register")
      fill_in "Username", with: "username"
      fill_in "Email", with: "email418@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on("Sign up")
      click_on("Logout")
      click_link("Login")
      fill_in "Email", :with => "email418@gmail.com"
      fill_in "Password", :with => "password"
      click_button('Log in')
      visit "/"
      expect(page).to have_content("Logout")
    end
  end

  #login function is tested in logins and users specs

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
    it "can view a list of their productions" do
      login_as_designer
      create_show_for_designer
      visit "/productions"
      expect(page).to have_content(@production.name)
    end
    xit 'can view one of their productions' do
      # login_as_designer
      # create_show_for_designer
      # visit "/productions"
      # click_on @productions.name. FIGURE OUT HOW TO TARGET LINK IN ROW
      # expect(page).to have_content(@production.name)
    end
    xit 'can edit a production' do
      #i'm  not sure we have this functionality yet
    end
    xit 'can delete a production' do
      # same as view one production, target in the table
    end
    xit 'can update their information' do
      #undefined method 'order' for NilClass
      login_as_designer
      click_on("Update registration")
      fill_in "Email", :with => "email@email.com"
      click_on("Update")
      click_on("Logout")
      click_on("Login")
      fill_in "Email", :with => "email@email.com"
      fill_in "Password", :with => "password"
      click_on("Log In")
      expect(page).to have_content("Logout")
    end
    xit 'can delete their account' do
      # doesn't want to click Cancel button
      login_as_designer
      click_on("Update registration")
      click_on("Cancel My Account")
      click_on("OK")
      click_link("Login")
      fill_in "Email", :with => "user@user.com"
      fill_in "Password", :with => "password"
      click_button('Log in')
      expect(page).to have_no_content("Logout")
    end
    # user logout tested in logins and users specs
  end

end
