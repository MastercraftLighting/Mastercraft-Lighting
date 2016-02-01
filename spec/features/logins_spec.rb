require 'rails_helper'

feature "Logins", :type => :feature do
  describe "The user is logged out" do
    it "can see a login button" do
      visit '/'
      expect(page).to have_link("Login")
    end
    # it "can click on the login button and see the form"
    #   visit '/'
    #   click
  end
end
