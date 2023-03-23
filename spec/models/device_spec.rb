require "rails_helper"

RSpec.describe Device, type: :model do
  context "creating a device" do
    let(:device) { build :device }

    it "should create device" do
      device.valid? == true
    end
    it "should have tag_no" do
      device.tag_no.present? == true
    end

    it "should have image_url" do
      device.image_url.present? == true
    end

    it "should have status false" do
      device.status == false
    end
  end
end
