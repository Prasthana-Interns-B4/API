require 'rails_helper'
require 'json'

RSpec.describe "Devices", type: :request do
  let(:user) { create(:user) }
  # let(:url) { '/users/sign_in' }
  # let(:params) do
  #   {
  #     user: {
  #       emp_id: user.emp_id,
  #       password: user.password
  #     }
  #   }
  # end
  describe "GET /index" do
    include ApiHelper
    before do
    #   post url, params: params.to_json, headers: { 'CONTENT_TYPE' => "application/json",
    #   'ACCEPT' => 'application/json'}
    authenticated_header(request, user)
    end
    it "get all devices from the database as login in" do
      get '/devices'#,{'HTTP_AUTHORIZATION' => "Bearer #{x}"}
       debugger
      expect(response).to have_http_status(:ok)
    end

    it "get  device from the database as not login in" do
      # debugger
      get '/devices/1'
      expect(response).to have_http_status(:not_found)
    end

  end
end





