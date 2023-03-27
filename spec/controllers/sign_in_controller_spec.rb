require 'rails_helper'

RSpec.describe Users::SessionsController do
  let(:user_sign) { create :user_sign }
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    setup_controller_for_warden
  end
  describe 'POST create' do
    it 'should sign in the user' do
      sign_in user(:user_sign)
    end
  end
end
