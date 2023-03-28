require 'rails_helper'

RSpec.describe "Devices", type: :request do
  let(:user) {User.create(id: 1,authentication_token: "123.456.789")}
  describe "GET /index" do
    it "get all devices from the database as login in" do
      get '/devices', params: {
       "Authorization" => "Bearer 123.456.789",
      }
      expect(response).to have_http_status(:ok)
    end

    it "get  device from the database as not login in" do
      get '/devices/1'
      expect(response).to have_http_status(:not_found)
    end

  end
end





