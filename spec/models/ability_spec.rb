require 'rails_helper'
require "cancan/matchers"
RSpec.describe Ability, type: :model do
  let(:user) {
    create(:user,
      :emp_id => "PR001",
      :email => "prasthana@prasthana.com",
      :password => "Prasthana@2023",
      # :role => "hr_manager"
    )}
  debugger
  let(:ability) {Ability.new(:user)}
  context "User login by his ability" do

    it {is_expected.to be_able_to(:manage, Device)}
  end
end
