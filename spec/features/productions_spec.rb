require 'rails_helper'

feature "Productions", :type => :feature, js: true do

  context "User is logged out" do
    it "is not given a choice to create a production" do
      visit "/"
      expect(page).to have_no_content("Create a new show")
    end
    xit "cannot visit the new production page" do
      visit "/"
    end
  end

  context "User is logged in as an Admin" do
    it "is not given the option to create a new show" do
      login_as_admin
      expect(page).to have_no_content("Create a new show")
    end
    it "does not have a link to their shows(that don't exist!)" do
      login_as_admin
      expect(page).to have_no_content("Your Shows")
    end
  end

  context "User is logged in as a designer" do
    it "is given the option to create a production"
    it "can create a new production"
    it "can view a list of their productions" do
      login_as_designer
      create_show_for_designer
      visit "/productions"
      expect(page).to have_content(@production.name)
    end
    it 'can view one of their productions' do
      login_as_designer
      create_show_for_designer
      visit "/productions"
      click_on('View')
      expect(page).to have_content("+ New Channel")
    end
    it "can edit their shows"

  end

end
