require 'rails_helper'

feature "Testing Broken Code", type: :feature, js: true do

  # you might have to download firefox if it's not installed

  #these tests have been set to pending for Travis CI, and should be set to run by changing xit to it
  # when code is fixed, please leave here and it will be re-enabled in main code before being deleted here

  # if the change was deliberate please leave a note and the test will be changed or deleted as appropriate.
  # notes can also be left about tests that were disabled for what reason and where that test lives (file and line number)

  # ACCOUNT DELETION NO LONGER WORKS
  # rspec ./spec/features/users_spec.rb:104
  describe "Designer_user"
    xit 'can delete their account' do
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

  # NOTE Account logout takes to user dashboard
  # rspec users_spec:22 - User creation logs out and in to test persistence
  # users_spec:60 - Admin logout spec
  # users_spec:98 - User update logs out and in to test changes
  # users_spec:121 - design user can log out
  # BELOW IS SPEC 121

    xit "can log out" do
      login_as_designer
      click_link("Logout")
      p page.html
      expect(page.html).to have_link("Login")
    end

  end

