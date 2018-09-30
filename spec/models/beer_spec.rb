require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "has the name set correctly" do
    beer = Beer.new name:"Bisse"
    expect(beer.name).to eq("Bisse")
  end  

  it "has the style set correctly" do
    beer = Beer.new style:"Weizen"
    expect(beer.style).to eq("Weizen")
  end

  describe "is saved" do
    let(:test_brewery) { Brewery.new name: "Panimo", year: 2000 }

    it "with proper values" do
      beer = Beer.create name: "Bisse", style: "Weizen", brewery: test_brewery
      expect(beer).to be_valid
      expect(Beer.count).to eq(1)
    end
  end

  describe "is not saved" do
    let(:test_brewery) { Brewery.new name: "test", year: 2000 }
    
    it "without a name" do
      beer = Beer.create style: "Weizen", brewery: test_brewery
      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "without a style" do
      beer = Beer.create name: "Bisse", brewery: test_brewery
      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "without a brewery" do
      beer = Beer.create name: "Bisse", style: "Weizen"
      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
  end
end