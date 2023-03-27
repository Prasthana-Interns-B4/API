require 'rails_helper'

RSpec.describe "UsersController", type: :request do
	let(:user) { create :user }

	# describe "GET /users" do
	# 	  it "should display all the users" do
	# 		# user = create(:user)
	#     get users_path
	#     expect(response).to have_http_status(200)
	#   end
	# end

	# describe "GET /users/pending" do
	# 	  it "should display all pending users" do
	# 		# user = create(:user)
	#     get pending_users_path
	#     expect(response).to have_http_status(200)
	#   end
	# end

  describe "PUT /users/forgot_password" do
    it "should check the emp_id and reset password" do
			# user = create(:user)
      put forgot_password_users_path(user: {emp_id: user.emp_id, password: 'Prasthana@2023'})
      expect(response).to have_http_status(200)
    end
  end

	# describe "PUT /users/:id/reset_password" do
  #   it "should reset password" do
	# 		# user = create(:user)
  #     put reset_password_user_path(id: user.id, user: {password: 'Prasthana@2023'})
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
