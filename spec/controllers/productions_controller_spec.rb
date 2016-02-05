require 'rails_helper'

RSpec.describe ProductionsController, :type => :controller do
  include Devise::TestHelpers

  describe 'get routes' do

    context '#index' do
      login_user

      it "responds with a successful 200" do
        get :index
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "renders the proper view" do
        get :index
        expect(response).to render_template('index')
      end

    end # context '#index'

    context '#new' do
      login_user

      it "responds with a successful 200" do
        get :new
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "renders the proper view" do
        get :new
        expect(response).to render_template('productions/_new_form')
      end

    end # context '#new'

    context '#show' do

      login_user
      it "responds with a successful 200" do
        production = FactoryGirl.create(:production)
        get :show, id: production.id
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "renders the proper view" do
        production = FactoryGirl.create(:production)
        get :show, id: production.id
        expect(response).to render_template('show')
      end

    end # context "#show"

  end # describe : get routes

  describe "'Post' Routes" do

    context "#create" do

      it "should be able to create a production" do
        create_usertypes
        test_user = FactoryGirl.create(:user, :designer)
        allow(controller).to receive(:current_user).and_return(test_user)
        test_production = FactoryGirl.build(:production)
        params = {production: {name: test_production.name, date: test_production.date}}
        expect{post "create", params}.to change{Production.count}
      end

    end # context '#create'

    context "#put" do

      # xit "can edit a production" do
      #   create_usertypes
      #   test_user = FactoryGirl.create(:user, :designer)
      #   allow(controller).to receive(:current_user).and_return(test_user)
      #   test_production = FactoryGirl.create(:production)
      #   params = {id: test_production.id, production: { name: "New Name For Production"}}
      #   put 'update', params
      #   expect(test_production.name).to eq("New Name For Production")
      # end

    end # context '#put'

    context "#destroy" do

      it "should be able to destroy a production" do
        create_usertypes
        test_user = FactoryGirl.create(:user, :designer)
        allow(controller).to receive(:current_user).and_return(test_user)
        test_production = FactoryGirl.create(:production)
        params = {id: test_production.id}
        expect{delete 'destroy', params}.to change{Production.count}
      end

    end # context '#destroy'

  end # describe "'Post' routes "

end # rspec top level
