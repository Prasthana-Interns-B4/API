class V1::UsersController < ApplicationController
    before_action :find_user, except: [:index , :create, :pending]
    load_and_authorize_resource 

    def index
      users = User.search_user(params[:search])
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
      user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth],  role_attributes: [:role])
   end

end