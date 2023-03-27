require 'rails_helper'
RSpec.describe Role, type: :model do
  context "when creating a new role" do
    let(:role) { create :role }
		it 'should create a new role with all attributes' do
      expect(role.valid?).to eq(true)
    end
		it 'should create a role with employee role' do
      expect(role.role).to eq "employee"
    end
		it 'should be an instance of Role' do
      expect(role).to be_an_instance_of Role
    end
	end
end
