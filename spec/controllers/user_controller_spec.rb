require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  ### NOTE : This route is not being used, is /admins instead
  # context "#index" do
  #   login_admin
  #   it "responds with a successful 200" do
  #     get :index
  #     expect(response).to be_success
  #     expect(response.status).to eq(200)
  #   end
  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end

  # context "#show" do
  #   login_user
  #   it "responds with a successful 200" do
  #     # get :show
  #     expect(response).to be_success
  #     expect(response.status).to eq(200)
  #   end
  #   it "renders the index template" do
  #     get :show
  #     expect(response).to render_template("show")
  #   end
  # end
  ### Also not a route anymore, do we need the controller???

end





