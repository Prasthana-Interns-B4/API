class V1::UsersController < ApplicationController
    before_action :find_user, except: [:index , :create]
    load_and_authorize_resource 

    def index
      users = params[:search].present? ? User.search_user(params[:search]) : User.where(status: "active")
      render json: users
    end

    def create
      user = User.create!(user_params)
      user.approve_user
      render json: user, status: :created
    end
 
    def show 
      render json:@user,status: :ok
    end

    def destroy 
      @user.devices.delete_all 
      @user.update!(status: "resign")
      head :no_content 
    end

    def update 
      @user.update!(user_params)
      render json: { user: @user,status: :ok}
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
      user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth],  role_attributes: [:role])
   end

end