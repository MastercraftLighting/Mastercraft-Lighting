require 'rails_helper'

feature "Easter Egg", :type => :feature, js: true do

  it "rickrolls everyone" do
    visit "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    sleep 8
    expect(true).to be_truthy
  end

end
