require 'rails_helper'

RSpec.describe Production, :type => :model do

  describe "Create" do
    it 'can be created with valid params' do
      production = Production.create(name: "Production", date:Date.new(12/12/2017))
      expect(production.id).to be_truthy
    end
    it 'can be created wihtout a date' do
      production = Production.create(name: "Production")
      expect(production.id).to be_truthy
    end
    it "cannot be created without a name" do
      production = Production.new(date: Date.new(12/12/2017))
      expect{production.save}.to raise_error
    end
  end

  describe "Read" do
    it "can output its name" do
      production = Production.create(name: "Production",date: Date.new(12/12/2017))
      expect(production.name).to eq("Production")
    end
    it "can output its date" do
      production = Production.create(name: "Production",date: Date.new(12/12/2017))
      expect(production.date).to eq(Date.new(12/12/2017))
    end
  end

  describe "Update" do
    it "can change its name" do
      production = Production.create(name: "Production",date: Date.new(12/12/2017))
      production.update(name:"New Name")
      expect(production.name).to eq("New Name")
    end
    it "can change its date" do
      production = Production.create(name: "Production",date: Date.new(12/12/2017))
      production.update(date: Date.new(12/01/2017))
      expect(production.date).to eq(Date.new(12/01/2017))
    end
  end

  describe "Destroy" do
    it "can be deleted" do
      production = Production.create(name: "Production",date: Date.new(12/12/2017))
      production.destroy
      expect(Production.all.length).to eq(0)
    end
  end

end
