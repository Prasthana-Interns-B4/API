require 'rails_helper'

RSpec.describe User, type: :model do
  context "when creating a new user" do
    let(:user) { create :user }

    it 'should create a new user with all attributes' do
      user.valid? == true
    end

    it 'should create a user with pending status' do
      expect(user.status).to eq "pending"
    end

    it 'should create a user with valid jti token' do
      expect(user.jti).not_to be_nil
    end

    it 'should be an instance of User' do
      expect(user).to be_an_instance_of User
    end
   end
end
