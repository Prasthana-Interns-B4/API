class V1::UsersController < ApplicationController
	before_action :find_user, only: %i[show update reset_password destroy]
	load_and_authorize_resource :except => %i[forgot_password]
	before_action :user_authorization, except: %i[forgot_password]

	# GET /users or /users.json
	# GET /users?search=s
	def index
		@users = params[:search].present? ? User.search(params[:search]) : User.all
		render json: @users, each_serializer: UserSerializer
	end

	# GET /users/1 or /users/1.json
	def show
		render json: @user, serializer: UserSerializer
	end

	# PUT/PATCH /users/forgot_password or /users/forgot_password.json
	def forgot_password
		@user = User.find_by!(emp_id: params[:user][:emp_id])
		if @user.present?
			@user.update!(password: params[:user][:password])
			head :ok
		end
	end

	# PATCH/PUT /users/1/reset_password or /users/1/reset_password.json
	def reset_password
		@user.update!(user_params)
		render json: {message: "password updated successfully"}
	end

	# PATCH/PUT /users/1 or /users/1.json
	def update
		@user.update!(user_params)
		render json: @user
	end

	private
	def find_user
		@user = User.includes(:user_detail, :devices).find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, 
			user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth])
	end
end