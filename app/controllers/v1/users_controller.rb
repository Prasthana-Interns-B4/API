class V1::UsersController < ApplicationController
	before_action :find_user, only: %i[show update destroy]
	load_and_authorize_resource :except => %i[forgot_password]

	# GET /users or /users.json
	# GET /users?search=s
	def index
		@users = User.search(params[:search])
		render json: @users, each_serializer: UserSerializer
	end

	# GET /users/1 or /users/1.json
	def show
		render json: @user, each_serializer: UserSerializer
	end

	# PUT/PATCH /users/forgot_password or /users/forgot_password.json
	def forgot_password
		@user = User.where(params.require(:user).permit[:emp_id])
		if @user.present?
			@user.update(params.require(:user).permit[:password])
			# head :ok
			render json: {message: "password changed"}
		else
			render json: {message: "Invalid User"}, status: 404
		end
	end

	# PATCH/PUT /users/1 or /users/1.json
	def update
		@user.update!(update_params)
		render json: {message: "#{update_params} updated successfully"}
	end

	private
	def find_user
		@user = User.includes(:user_detail, :devices).find(params[:id])
	end
	def update_params
		params.require(:user).permit(:email, :password, 
			:user_detail_attributes[:first_name, :last_name, :designation, :phone_number, :date_of_birth])
	end
end