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

end
