require 'rails_helper'

RSpec.describe Users::RegistrationsController do
  describe 'POST crete' do
    it 'should accept params with json format' do
      post :create, params: {
        user: {
          "emp_id": "PR001",
          "password": "Prasthana@2023"
        }
      }
    end
  end
end
