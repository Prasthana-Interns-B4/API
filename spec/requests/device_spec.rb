require 'rails_helper'
require 'json'

RSpec.describe "Devices", type: :request do
  let(:user) { create(:user) }
  let(:user1) {create(:user)}
  let(:user2) {create(:user)}
  let(:params) do
    {
      user: {
        emp_id: user.emp_id,
        password: user.password
      }
    }
  end
  let(:device)  {create(:device)}
  let(:device2) {create(:device)}
  let(:device3) {create(:device)}
  let(:device4) {create(:device)}


  describe "Action performed as facility manager" do
    before do
      post '/users/sign_in' , params: params.to_json, headers: { 'CONTENT_TYPE' => "application/json",
      'ACCEPT' => 'application/json'}
      user.role = Role.create(role: "facility_manager")
    end
    it "get all devices from the database" do
      get '/devices',headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
    end

    it "get  device from the database" do
      get "/devices/#{device.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
     end

    it "create a device" do
      post "/devices",params: {
                "device" => {
                  "name" => "Lenovo",
                  "device_type" => "laptop",
                  "category" => "Electronics",
                  "os" => "windows"
                }

      },headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:created)
    end

    it "update a device" do
      put "/devices/#{device.id}",params: {
                "device" => {
                  "name" => "Dell",
                  "device_type" => "laptop",
                  "category" => "Electronics",
                  "os" => "Ubuntu"
                }

      },headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:created)
    end

    it "Destroy a device" do
      delete "/devices/#{device2.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:no_content)
    end

    it "Assign a device" do
      put "/devices/#{device2.id}/assign",params: {
          "device" => {
            "user_id" => "#{user2.id}}"
          }},headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
    end

    it "unassign a device" do
      put "/devices/#{device2.id}/unassign",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
    end

  end

  context "Action performed by hr_manager" do
    before do
       post '/users/sign_in', params: params.to_json, headers: { 'CONTENT_TYPE' => "application/json",
        'ACCEPT' => 'application/json'}
       user.role = Role.create(role: "hr_manager")
        user.devices << device3
    end

    it "get all devices from the database as login in as hr_manager" do
      user.role = Role.create(role: "hr_manger")
      get '/devices',headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
    end

    it "show call of assigned device" do
      get "/devices/#{device3.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
    end

    it "show call of unassigned device" do
      get "/devices/#{device.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
    end

    it "don't execute put call devices unassigned" do
      put "/devices/#{device.id}",params: {
                "device" => {
                  "name" => "Dell",
                  "device_type" => "laptop",
                  "category" => "Electronics",
                  "os" => "Ubuntu"
                }

      },headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
    end
  end


  context "Action performed by employee" do
    before do
      post '/users/sign_in', params: params.to_json, headers: { 'CONTENT_TYPE' => "application/json",
      'ACCEPT' => 'application/json'}
      user.role = Role.create(role: "employee")
        user.devices << device4
    end

    it "get all devices from the database as login in as employee" do
      user.role = Role.create(role: "employee")
      get '/devices',headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
    end

    it "show call of assigned device" do
      get "/devices/#{device4.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(:ok)
    end

    it "show call of unassigned device" do
      get "/devices/#{device.id}",headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
    end
  end
end





