require 'rails_helper'

feature "Libraries", :type => :feature do

  def login_as_designer
    @user = User.create!(FactoryGirl.attributes_for :user, :designer)
    visit '/'
    click_link("Login")
    fill_in "Email", :with => "user@user.com"
    fill_in "Password", :with => "password"
    click_button('Log in')
    visit "/"
  end

  describe "Root Page" do
    it "has a link to Libraries" do
      login_as_designer
      expect(page).to have_selector("a", "Libraries")
    end
    it "has a link that leads to Libraries Index" do
      login_as_designer
      click_link("Libraries")
      expect(page).to have_content("Libraries")
      expect(page).to have_content("Equipment Library")
      expect(page).to have_content("Color Library")
    end
  end

  describe "Libraries Index" do
    it "has a link that leads to Equipment library" do
      login_as_designer
      visit "/libraries"
      click_on("Equipment Library")
      expect(page).to have_content("Equipment Library")
    end
    it "has a link that leads to Color library" do
      login_as_designer
      visit "/libraries"
      click_on("Color Library")
      expect(page).to have_content("Color Library")
    end
  end

  describe "Equipment Library" do
    it "displays its equipment" do
      @units = []
      @units << UnitLibrary.create!(FactoryGirl.attributes_for :unit_library)
      login_as_designer
      visit '/libraries/equipment'
      expect(page).to have_content("string data")
    end
  end

  describe "Color Library" do
    it "displays its colors" do
      @colors = []
      @colors << ColorLibrary.create!(FactoryGirl.attributes_for :color_library)
      login_as_designer
      visit '/libraries/colors'
      expect(page).to have_content("stringdata")
    end
  end

end
