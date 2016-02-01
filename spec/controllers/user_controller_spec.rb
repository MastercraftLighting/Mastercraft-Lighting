require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe UsersController do
    # let(:new_user) { FactoryGirl.create :user, :non_admin }
    # let(:admin) { FactoryGirl.create :user, :admin }
    let(:attributes_user) { FactoryGirl.attributes_for :user, :non_admin}
    let(:attributes_admin) { FactoryGirl.attributes_for :user, :admin}

    describe "GET #index for admin" do
      before(:each) do
        admin = User.create!(attributes_admin)
        session[:user_id] = admin.id
        get :index
      end
      it "responds with a successful 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
      it "assigns the @users instance variable" do
        expect(assigns(:users)).to be_an(ActiveRecord::Relation)
      end
      it "the @users instance variable has users in it" do
        expect(assigns(:users).class).to eq("User")
      end
      it "renders the index template" do
        expect(response).to render_template("index")
      end
    end

    describe "GET #index for non_admin" do
      before(:each) do
        user = User.create!(attributes_user)
        session[:user_id] = user.id
        get :index
      end
      it "responds with a redirect" do
        expect(response.status).to eq(302)
      end
    end

      # describe 'GET #show' do
      #   before(:each) do
      #     get :show, id: user.idbe rspec
      #   end

      #   it "assigns the user instance variable" do
      #     expect(assigns[:user]).to be_a(User)
      #   end
      # end


  end
end





