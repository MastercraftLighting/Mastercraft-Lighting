require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  context "User comes to the site" do
    it "displays welcome page" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
