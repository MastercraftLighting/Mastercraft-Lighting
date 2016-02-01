# require 'rails_helper'

# require 'rails_helper'
# RSpec.describe ProductsController, type: :controller do
#   # let(:admin) { User.create!(username:"jon", title:"admin", password_hash: "123")}
#   before(:each) do
#     # session[:user_id] = admin.id
#     # get :index
#   end

#   describe "index action" do

#     before do
#       @all_products = 3.times.map do |n|
#         Product.create( name: "Notebook #{n}", price: 10, image: "/products/notebook.jpg", category_id: 1)
#       end
#     end

#     it 'should load all products' do
#       get :index
#       expect(assigns[:products]).to eq @all_products
#       expect(response.status).to eq 200
#       # expect(response).to have_rendered(:index)
#     end
#   end

#   describe "#show" do
#     before do
#       @product = Product.create( id: 1,  name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
#     end

#     it 'should load product' do
#       get :show, {"id"=>"1"}
#       expect(assigns[:product]).to eq Product.find_by(name: "Notebook")
#       expect(response.status).to eq 200
#       expect(response).to have_rendered(:show)
#     end
#   end

#     describe "#new" do
#       it 'should load form' do
#       get :new
#       expect(response.status).to eq 302
#     end
#   end

#   describe "#edit" do
#     before do
#       @product = Product.create( id: 10,  name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
#     end

#     it 'should load product to be edited' do
#       get :edit, {"id"=>"10"}
#       # expect(assigns[:product]).to eq Product.find_by(name: "Notebook")
#       expect(response.status).to eq 302
#       # expect(response).to have_rendered(:edit)
#     end
#   end

#   describe 'POST #create' do
#     let(:attributes){ { name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1}}
#     it "provides correct response" do
#       post :create, :product => attributes
#       expect(response.status).to eq(302)
#     end
#   end

#   # describe 'PUT #update' do
#   #   let(:attributes){ { name: "Dog", price: 10, image: "/products/notebook.jpg", category_id: 1}}
#   #   before do
#   #     @product = Product.create!(id: 100,  name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
#   #   end
#   #   it "provides correct response" do
#   #     patch :update, :product => attributes
#   #     expect(Product.find(100).name).to eq("Dog")
#   #     expect(response.status).to eq(302)
#   #   end
#   # end

#   describe 'DELETE #destroy' do
#     it 'redirects' do
#       @product = Product.create!(id: 1000,  name: "Notebook", price: 10, image: "/products/notebook.jpg", category_id: 1)
#       delete :destroy, id: 1000
#       expect(response.status).to eq(302)
#     end
#   end

# end
