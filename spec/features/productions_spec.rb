require 'rails_helper'

feature "Productions", :type => :feature, js: true do

  context "User is logged out" do
    it "is not given a choice to create a production" do
      visit "/"
      expect(page).to have_no_content("Create a new show")
    end
    # BELOW - you can visit the page, but it errors due to no id
    # MAYBE make it redirect if visited directly, but error might be enough
    # it "cannot visit the new production page" do
    #   visit "/productions/new"
    #   expect(page).to have_no_content("New Show")
    # end
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
    # BELOW TWO TESTS ARE A TECHNICALITY, DO WHAT YOU WILL WITH IT
    # it "cannot visit the new production page" do
    #   login_as_admin
    #   visit "/productions/new"
    #   expect(page).to have_no_content("New Show")
    # end
    # it "cannot visit the new production page" do
    #   login_as_admin
    #   create_show_for_designer
    #   visit "/productions"
    #   expect(page).to have_no_content(@production.name)
    # end
  end

  context "User is logged in as a designer" do
    it "is given the option to create a production" do
      login_as_designer
      expect(page).to have_link("Create a new show")
    end
    it "can create a new production" do
      login_as_designer
      click_on("Create a new show")
      within ".new_production" do
        fill_in 'Production Name', with: 'ProductionTesting'
        fill_in "Production Date", with: "02/06/2016"
        click_on("Create Show")
      end
      expect(page).to have_content("ProductionTesting")
    end
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
    #below- not yet implemented functionality
    # it "can edit their shows"

  end

end
