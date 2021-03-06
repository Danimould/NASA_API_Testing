require_relative "../lib/nEarthObject.rb"

describe "NASA N.E.O API" do
  before(:all) do
    @service = NearEarthObject.new.nEarthObjectService "2015-09-07", "2015-09-10"
    @data = @service.data
  end

  context "Day Weather Properties" do
    it "should contain an hash" do
      expect(@data).to be_a Hash
    end

    it "the hash should be of length 3" do
      expect(@data.length).to eq 3
    end

    it "element_count should return an int" do
      expect(@data["element_count"]).to be_an Integer
    end

    it "should have access to setDaysInSearch" do
      expect(@service).to respond_to :setDaysInSearch
    end

    it "should have an integer value assigned to @daysInSearch" do
      expect(@service.daysInSearch).to be_an Integer
    end

    it "should get a value greater than 1 for @daysInSearch" do
      expect(@service.daysInSearch).to be > 0
    end
  end

  context "near_earth_objects property" do
    it "should contain one element for each day searched" do
      expect(@data["near_earth_objects"].length).to eq @service.daysInSearch
    end
  end

  context "dates within near_earth_objects" do
    it "should contain many items with 11 properties" do
      @service.getNearEarthDates.each do |dateInfo|
        puts dateInfo.length
        expect(dateInfo.length).to eq 11
      end
    end

    it "should have the propterty: "
  end

  #   it "should contain an array" do
  #     expect(@service).to all(be_an Array)
  #   end
  #
  #   it "should contain 'coord' property" do
  #     expect(@service).to have_key "coord"
  #   end
  #
  #   it "should contain 'weather' property" do
  #     expect(@service).to have_key "weather"
  #   end
  #
  #   it "should contain 'base' property" do
  #     expect(@service).to have_key "base"
  #   end
  #
  #   it "should contain 'main' property" do
  #     expect(@service).to have_key "main"
  #   end
  #
  #   it "should contain 'visibility' property" do
  #     expect(@service).to have_key "visibility"
  #   end
  #
  #   it "should contain 'wind' property" do
  #     expect(@service).to have_key "wind"
  #   end
  #
  #   it "should contain 'clouds' property" do
  #     expect(@service).to have_key "clouds"
  #   end
  #
  #   it "should contain 'dt' property" do
  #     expect(@service).to have_key "dt"
  #   end
  #
  #   it "should contain 'sys' property" do
  #     expect(@service).to have_key "sys"
  #   end
  #
  #   it "should contain 'id' property" do
  #     expect(@service).to have_key "id"
  #   end
  #
  #   it "should contain 'name' property" do
  #     expect(@service).to have_key "name"
  #   end
  #
  #   it "should contain 'cod' property" do
  #     expect(@service).to have_key "cod"
  #   end
  #
  # end
  #
  # context "id" do
  #   it "should be an integer" do
  #     expect(@service["id"]).to be_an Integer
  #   end
  # end
  #
  # context "coord" do
  #   it "should contain 2 properties" do
  #     expect(@service["coord"].length).to eq 2
  #   end
  #
  #   it "should contain propterty 'lon'" do
  #     expect(@service["coord"]).to have_key "lon"
  #   end
  #
  #   it "should contain a float within 'lon'" do
  #     expect(@service["coord"]["lon"]).to be_a Float
  #   end
  #
  #   it "should contain propterty 'lat'" do
  #     expect(@service["coord"]).to have_key "lat"
  #   end
  #
  #   it "should contain a float within 'lat'" do
  #     expect(@service["coord"]["lat"]).to be_a Float
  #   end

end
