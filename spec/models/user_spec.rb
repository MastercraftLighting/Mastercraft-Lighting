require 'spec_helper'
require 'rails_helper'

RSpec.describe User, type: :model do

  describe "create" do
    it "can be created as a designer with valid params" do
      user = User.new(FactoryGirl.attributes_for :user, :designer)
      expect{user.save}.to change{User.all.length}.by(1)
    end
    it "can be created as a admin with valid params" do
      user = User.new(FactoryGirl.attributes_for :user, :admin)
      expect{user.save}.to change{User.all.length}.by(1)
    end
    it "cannot be created without a usertype" do
      user = User.new(email: "user@user.com", username: 'username', password: 'password')
      expect{user.save}.to raise_error
    end
    it "cannot be created without a username" do
      user = User.new(email: "user@user.com", password: 'password', user_type_id: 1)
      expect{user.save}.to raise_error
    end
    it "cannot be created without a email" do
      user = User.create(username: 'username', password: 'password', user_type_id: 1)
      expect(user.id).to eq(nil)
    end
    it "cannot be created without a password" do
      user = User.create(email: "user@user.com", username: 'username', user_type_id: 1)
      expect(user.id).to eq(nil)
    end
  end

  describe "read" do
    it "can output username" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      expect(user.username).to eq("username")
    end
    it "can output email" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      expect(user.email).to eq("user@user.com")
    end
    it "can output usertype" do
      create_usertypes
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      expect(user.user_type.name).to eq("Designer")
    end
    it "cannot output plaintext password" do
      User.create(FactoryGirl.attributes_for :user, :designer)
      user = User.find(1)
      expect(user.password).not_to eq("password")
    end
  end

  describe "update" do
    it "can update username" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      user.update(username:"username2")
      expect(user.username).to eq("username2")
    end
    it "can update user type" do
      create_usertypes
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      user.update(user_type_id: 2)
      expect(user.user_type.name).to eq("ME")
    end
    it "can update email" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      user.update(email:"email2@email.com")
      expect(user.email).to eq("email2@email.com")
    end
    it "can update password" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      old_password = user.encrypted_password
      user.update(password:"aNewPasswordSoSecureWow")
      expect(user.encrypted_password).not_to eq(old_password)
    end
  end

  describe "destroy" do
    it "can be removed from the database" do
      user = User.create(FactoryGirl.attributes_for :user, :designer)
      user.destroy
      expect(User.all.length).to eq(0)
    end
  end

end
