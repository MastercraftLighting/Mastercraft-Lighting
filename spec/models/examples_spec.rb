# require 'rails_helper'

# EXAMPLE TESTS FROM JON- NOT FOR THIS APP

# describe User do
#   let

#   context 'new User' do
#     it 'is valid with a username, title, and password' do
#       user = User.new(username:'Bob', admin: false, password:'password')
#       user.valid?
#     end
#     it 'is invalid without a username' do
#       user = User.new(password:'password')
#       expect(user.valid?).to be false
#     end
#     it 'is invalid without a unique username' do
#       user = User.create(username:'Bob', admin: false, password:'password')
#       user2 = User.create(username:'Bob', admin: true, password:'password')
#       expect(user2.valid?).to be false
#     end
#   end
#   context 'testing validations and associations' do
#       # Basic validations
#     it { should validate_presence_of(:username) }
#     it { should validate_presence_of(:first_name) }
#     it { should validate_presence_of(:last_name) }
#     it { should validate_presence_of(:password) }
#     it { should have_secure_password }
#     # Associations
#     it { should have_many(:addresses) }
#     it { should have_many(:financial_informations) }
#     it { should have_many(:ordered_carts).class_name('Cart') } #.conditions(order_id: true) }
#     it { should have_many(:active_carts).class_name('Cart') } #.conditions(order_id: false) }
#     it { should have_many(:products_ordered).through(:ordered_carts)} #.conditions(order_id: true) }
#     it { should have_many(:products_in_cart).through(:active_carts)} #.conditions(order_id: false)}
#   end
# end
