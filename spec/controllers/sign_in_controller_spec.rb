require 'rails_helper'
require "json"

RSpec.describe "POST /users", type: :request do
  let(:user) { create(:user) }
  let(:url) { '/users/sign_in' }
  let(:params) do
    {
      user: {
        emp_id: user.emp_id,
        password: user.password
      }
    }
  end
    context "when params are correct " do
      before do
        post url, params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      end

      it "should return status 200" do
        debugger
        expect(response).to have_http_status(200)
      end

      it "shoud have authorization in header" do
        expect(response.headers['Authorization']).to be_present
      end
    end

    # context "when params are not correct" do
    #   let(:user_params) do
    #     {
    #       user: {
    #         emp_id: "asdfafqw34",
    #         password: "ateasdf"
    #       }
    #     }
    #   end

    # end
    # context "when the user is resigned user" do
    #   let(:pending_user) { create(:user) }
    #   before do
    #     post url, params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
    #   end

    #   it 'should have the user status as pending' do
    #     expect(pending_user.status).to eq("pending")
    #   end

    #   it "should return status 401" do
    #     expect(response).to have_http_status(401)
    #   end

    #   it 'should not create the authorization token' do
    #     expect(response.headers['Authorization']).not_to be_present
    #   end
    # end
  end
