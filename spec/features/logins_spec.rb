require 'rails_helper'

feature "Logins", :type => :feature do
  describe "The user is logged out" do
    it "can see a login button" do
      visit '/'
      expect(page).to have_link("Login")
    end
    it "can click on the login button and see the form" do
      visit '/'
      expect(page).to have_no_content("Log in")
      click_link("Login")
      expect(page).to have_content("Log in")
    end
    it "can fill out form and submit to log in" do
      user = User.create(user_type: "Designer", username: "username", email: "email@email.com", password: "password")
      visit '/'
      click_link("Login")
      fill_in "Email", :with => user.email
      fill_in "Password", :with => "password"
      click_button('Log in')
      expect(page).to have_link("Logout")
    end
  end
end
