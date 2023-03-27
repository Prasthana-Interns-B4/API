require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  context "when creating a new user_detail" do
    let(:user_detail) { create :user_detail }

		it 'should create a new user_detail with all attributes' do
			expect(user_detail.valid?).to eq(true) 
    end

		it 'should be an instance of UserDetail' do
      expect(user_detail).to be_instance_of(UserDetail)
    end
	end
end
