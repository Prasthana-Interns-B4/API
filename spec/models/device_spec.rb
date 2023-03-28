require 'rails_helper'

RSpec.describe Device, type: :model do
  context "passing arguments " do
    let(:laptop) {create :device,name:"laptop-2345",device_type: "laptop",os: "Windows", category: "Electronics"}
    it "creating a laptop " do
      expect(laptop).to be_instance_of(Device)
      expect(laptop.status).to eq(false)
      expect(laptop.tag_no).to be_start_with("DEV-")
      expect(laptop.image_url).to eq("https://m.media-amazon.com/images/I/61Dw5Z8LzJL._SX522_.jpg")
    end
    it "updating a laptop details" do
      laptop.update!(name: "Dell-5330")
      expect(laptop).to be_instance_of(Device)
      expect(laptop.status).to eq(false)
      expect(laptop.name).to eq("Dell-5330")
    end

  end

  context "creating a basic mobile device" do
    let(:mobile) {create :device}

    it "should have details" do
      expect(mobile.status).to be_falsey
      expect(mobile.tag_no).to be_start_with("DEV-")
      expect(mobile.user_id).to be_nil
      expect(mobile.image_url).to eq("https://m.media-amazon.com/images/I/71emcsxsRPL._SX679_.jpg")
      expect(mobile).to  be_instance_of(Device)
    end

  end


end
