require 'rails_helper'

RSpec.describe AdminsController, :type => :controller do
  include Devise::TestHelpers


  describe "GET #index for admin" do
    login_admin

    it "responds with a successful 200" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "assigns the @users instance variable" do
      get :index
      expect(assigns(:users)).to be_an(ActiveRecord::Relation)
    end
    # it "the @users instance variable has users in it" do
    #   get :index
    #   expect(assigns(:users).class).to eq("User")
    # end
    #
    # NOTE: above would need to be stubbed to run, and would therefore be a useless test
    # because :users would be, by force, a collection of Users
    # Because on test database not development
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #index for non_admin" do
    login_user

    it "responds with a redirect" do
      get :index
      expect(response).to redirect_to(:root)
      # does not respond to a 302 status because it hits the 302 and bounces
      # back, leading to a 200 on the page redirected to, I'm fairly certain
    end
  end

end
