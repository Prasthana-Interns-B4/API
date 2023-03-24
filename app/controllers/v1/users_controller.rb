class V1::UsersController < ApplicationController
	before_action :user_authorization, except: %i[forgot_password]
	before_action :find_user, except: %i[index create pending forgot_password]
	load_and_authorize_resource :except => %i[forgot_password]

	def index
		users = User.search(params[:search])
		render json: users,each_serializer: UserSerializer
	end

	def pending
		users= User.where(status: "pending")
		render json: users,each_serializer: UserSerializer
	end


	def create
		user = User.create!(user_params)
		user.approve_user
		render json: user, status: :created,serializer: UserSerializer
	end

	def show
		render json:@user,status: :ok,serializer: UserSerializer
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
		@user.update!(password: params[:user][:password])
		render json: {message: "password updated successfully"}
	end

	def destroy
		@user.devices.delete_all
		@user.update!(status: "resign")
		head :no_content
	end

	def update
		@user.update!(user_params)
		render json: { user: @user,status: :ok},each_serializer: UserSerializer
	end

	def approve
		@user.approve_user
		render json: {status: :ok}
	end

private
	def find_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password,
			user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth],
			role_attributes: [:role]
		)
	end
end
