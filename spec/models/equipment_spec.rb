require 'rails_helper'

RSpec.describe Equipment, :type => :model do

  describe "Create" do
    it "can be created" do
      equip = Equipment.create!(instrument_type:"Lights")
      expect(equip.id).to be_truthy
    end
  end

  describe "Read" do
    it "can send back pertinent data (non specific test)" do
      equip = Equipment.create!(instrument_type: "Lights")
      expect(equip.instrument_type).to eq("Lights")
    end
    it "gives a notifying symbol on empty circuit name" do
      equip = Equipment.create!(instrument_type: "Lights")
      expect(equip.circuit_name).to eq("!")
    end
  end

  describe "Update" do
    it "accepts updates to data (non specific test)" do
      equip = Equipment.create!(instrument_type: "Lights")
      equip.update(instrument_type: "NotALight")
      expect(equip.instrument_type).to eq("NotALight")
    end
  end

  describe "Destroy" do
    it "can be deleted" do
      equip = Equipment.create!(instrument_type: "Lights")
      equip.destroy
      expect(Equipment.all.length).to eq(0)
    end

  end

end
