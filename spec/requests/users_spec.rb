require 'rails_helper'
require 'json'

RSpec.describe "UsersController", type: :request do
	let(:user) { create :user }
	let(:user1) { create :user }
	# let(:role) { create :user.role }
	let(:url) {'/users/sign_in'}
	let(:params) do
		{
			user: {
				emp_id: user.emp_id,
				password: user.password
			}
		}
	end

	describe "GET /users" do
		before do
			post url, params: params.to_json, headers: {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
		end
		it "should display all the users if the user is HR Manger" do
			user.role = Role.create(role: 'hr_manager')
	    get users_path, headers: { 'Authorization' => response.headers['Authorization']}
	    expect(response).to have_http_status(200)
	  end
		it "should display all the users if the user is Facility Manger" do
			user.role = Role.create(role: 'facility_manager')
	    get users_path, headers: { 'Authorization' => response.headers['Authorization']}
	    expect(response).to have_http_status(200)
	  end
		it "should not display all the users if the user is Employee" do
			user.role = Role.create(role: 'employee')
	    get users_path, headers: { 'Authorization' => response.headers['Authorization']}
	    expect(response).to have_http_status(401)
	  end
	end

	describe "GET /users/pending" do
		before do
			post url, params: params.to_json, headers: {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
		end
		it "should display pending users if user is HR Manager only" do
			user.role = Role.create(role: 'hr_manager')
	    get pending_users_path, headers: { 'Authorization' => response.headers['Authorization']}
	    expect(response).to have_http_status(200)
	  end
		it "should not display pending users if user is not HR Manager" do
			user.role = Role.create(role: 'facility_manager')
			get pending_users_path, headers: { 'Authorization' => response.headers['Authorization']}
	    expect(response).to have_http_status(401)
		end
	end

  describe "PUT /users/forgot_password" do
    it "should check the emp_id and reset password" do
      put forgot_password_users_path(user: {emp_id: user.emp_id, password: 'Prasthana@2023'})
      expect(response).to have_http_status(200)
    end
  end

	describe "PUT /users/:id/reset_password" do
		before do
			post url, params: params.to_json, headers: {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
		end
    it "should reset their own password" do
			user.role=Role.create(role: 'employee')
      put reset_password_user_path(id: user.id, user: {password: 'Prasthana@2023'}), 
			headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(200)
    end
		it "should not reset others password" do
			user.role=Role.create(role: 'employee')
      put reset_password_user_path(id: user1.id, user: {password: 'Prasthana@2023'}), 
			headers: { 'Authorization' => response.headers['Authorization']}
      expect(response).to have_http_status(401)
		end
  end
end
