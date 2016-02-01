require 'rails_helper'

RSpec.describe LibrariesController, :type => :controller do

  describe "Get #index" do
    it "responds successfully with a HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Get #show" do
    context "Equipment Library" do
      it "responds successfully with a HTTP 200 status code" do
        get :show, id: 'equipment'
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        get :show, id: 'equipment'
        expect(response).to render_template("equipment")
      end
    end
    context "Color Library" do
    end
    context "Color Library" do
      it "responds successfully with a HTTP 200 status code" do
        get :show, id: 'colors'
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        get :show, id: 'colors'
        expect(response).to render_template("colors")
      end
    end
  end

end
