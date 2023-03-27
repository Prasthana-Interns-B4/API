require 'rails_helper'

RSpec.describe Users::RegistrationsController do
  let(:user) { FactoryBot.create(:user) }
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    setup_controller_for_warden
  end
  describe 'POST crete' do
    it 'should accept the params in json format' do
      post :create, params: {
        user: {
          email: "nasim@prasthana.com",
          password: "123456",
          user_detail_attributes: {
            first_name: "Nasim",
            last_name: "Khan",
            phone_number: 9125346785,
            designation: "Java Dev",
            date_of_birth: Date.today
          },
          role_attributes: {
            role: "employee"
          }
        }
      }
    end
    it 'should create the user' do
      post :create, params: { user: attributes_for(:user) }
      expect(response).to have_http_status(:created)
    end
  end
end
