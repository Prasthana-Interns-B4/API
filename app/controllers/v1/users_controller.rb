class V1::UsersController < ApplicationController
	before_action :find_user, only: %i[show update reset_password destroy]
	load_and_authorize_resource :except => %i[forgot_password]

	# GET /users or /users.json
	# GET /users?search=s
	def index
		@users = params[:search].present? ? User.search(params[:search]) : User.all
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
			@user.update!(params.require(:user).permit[:password])
			head :ok
			# render json: {message: "password changed"}
		else
			render json: {message: "Invalid User"}, status: 404
		end
	end

	# PATCH/PUT /users/1/reset_password or /users/1/reset_password.json
	def reset_password
		@user.update!(update_params)
		render json: {message: "password updated successfully"}
	end

	private
	def find_user
		@user = User.includes(:user_detail, :devices).find(params[:id])
	end
	def update_params
		params.require(:user).permit(:email, :password, 
			user_detail_attrinutes: [:first_name, :last_name, :designation, :phone_number, :date_of_birth])
	end
end