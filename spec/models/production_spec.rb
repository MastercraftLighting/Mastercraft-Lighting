require 'rails_helper'

RSpec.describe Production, :type => :model do

  describe "Create" do
    context "when valid" do
      it 'can be created' do
        production = Production.create(name: "Production")
        expect(production.id).to be_truthy
      end
    end
    context "when not valid" do
      # it 'cannot be created' do
      #   expect(Production.create).to raise_error
      # end
    end
  end

  # describe "Read" do

  # end

  # describe "Update" do
  #   context "when valid" do
  #     it 'can be updated' do
  #     end
  #   end
  #   context "when not valid" do
  #     it 'cannot be updated'
  #   end
  # end

  # describe "Destroy" do

  # end

end
