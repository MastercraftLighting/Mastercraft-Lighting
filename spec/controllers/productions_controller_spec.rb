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
    end

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
    end

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
    end

  end

  describe "'Post' Routes" do
    context "#create" do
      it "should be able to create a production" do
        create_usertypes
        test_user = FactoryGirl.create(:user, :designer)
        test_production = FactoryGirl.build(:production)

        allow(controller).to receive(:current_user).and_return(test_user)

        params = {production: {name: test_production.name, date: test_production.date}}
        expect{post "create", params}.to change{Production.count}
      end
    end
    context "#put" do
    end
    context "#destroy" do
      xit "should be able to destroy a production" do
        production = FactoryGirl.create(:production)
        expect{delete 'destroy', production.id}.to change{Production.count}
      end
    end
  end

end
