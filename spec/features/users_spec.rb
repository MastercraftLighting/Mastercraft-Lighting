require 'rails_helper'

feature "Users", :type => :feature, js: true do

  context "User does not have account" do
  it "can create a new account" do
    users = ['Designer','ME','Administrator','Lead']
    users.each do |name|
      UserType.create!(name: name)
    end
    visit "/"
    within 'nav' do
      click_link("Register")
    end
    fill_in "Username", with: "username"
    fill_in "Email", with: "user2@user.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    page.select 'Designer', :from => 'User type'
    click_on("Sign up")
    click_on("Logout")
    click_link("Login")
    fill_in "Email", :with => "user2@user.com"
    fill_in "Password", :with => "password"
    click_button('Log in')
    visit "/"
    expect(page).to have_content("Logout")
  end
  it "cannot create an Admin account through form" do
    users = ['Designer','ME','Administrator','Lead']
    users.each do |name|
      UserType.create!(name: name)
    end
    visit "/"
    within 'nav' do
      click_link("Register")
    end
    expect(page).to have_content("Lead")
  end

end

  describe "Admin user" do
    it "can log in" do
      login_as_admin
      expect(page).to have_link("Logout")
    end
    it "can view other users" do
      # edit to use path clicking
      login_as_admin
      visit "/admins"
      expect(page).to have_content("You are logged in as a")
    end
    # it "can edit their information"
    # it "can delete their account"
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
    it "cannot see list of all users" do
      # edit to use path clicking
      login_as_designer
      visit "/admins"
      expect(page).to have_no_content("You are logged in as a")
    end
    it "can create a production" do
      users = ['Designer','ME','Administrator','Lead']
      users.each do |name|
        UserType.create!(name: name)
      end
      login_as_designer
      click_on("Create a new show")
      fill_in "Production Name:", :with => "Show Name"
      fill_in "Production Date:", :with => "02/09/2016"
      click_on("Create Show")
      expect(page).to have_no_content("Administrator")
    end
    it 'can update their information' do
      users = ['Designer','ME','Administrator','Lead']
      users.each do |name|
        UserType.create!(name: name)
      end
      login_as_designer
      click_on("Update registration")
      fill_in "Email", :with => "email@email.com"
      fill_in "Current password", :with => "password"
      click_on("Update")
      click_on("Logout")
      click_on("Login")
      fill_in "Email", :with => "email@email.com"
      fill_in "Password", :with => "password"
      click_on("Log in")
      expect(page).to have_content("Logout")
    end
    it 'can delete their account' do
      # doesn't want to click Cancel button
      login_as_designer
      click_on("Update registration")
      click_on("Cancel my account")
      # below clicks "OK" on
      page.driver.browser.switch_to.alert.accept
      click_link("Login")
      fill_in "Email", :with => "user@user.com"
      fill_in "Password", :with => "password"
      click_button('Log in')
      expect(page).to have_no_content("Logout")
    end
    it "can log out" do
      login_as_designer
      click_link("Logout")
      expect(page.html).to have_link("Login")
    end
  end

end
