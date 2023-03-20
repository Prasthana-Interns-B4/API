class V1::UsersController < ApplicationController
    before_action :find_user, except: [:index ,:create]
    before_action :authenticate_user 
    load_and_authorize_resource 

    def index  #for all active employes and search_implentaion
      users = params[:type].present? ? UserDetail.search(params[:type]) : User.where(status: "active")
      render json: users
    end

    def create
      user = User.create!(user_params) #user_params from applicationcontroller
      render json: user, status: :created
    end
 
    def show  #for user and hr_manager
      render json:@user,status: :ok
    end

    def destroy #for soft delete and reject 
      @user.devices.update!(user_id: nil) #before destroying removing devices association
      @user.update!(status: "resign")
      render json:{message:"user removed succsussfully" } ,status: :ok   
    end

    def update # 
      @user.update!(update_params)
      render json: { user: @user, message: "#{update_params} updatead succsussfully" },status: :ok
    end

    def approve
      @user.approve_user
      render json:{message: "You have approved"},status: :ok
    end

  private
  def find_user #to find record
     @user = User.find(params[:id]) 
  end


  def update_params
    params.require(:user).permit(:password, 
    user_detail_attributes: [:first_name, :last_name, :phone_number, :date_of_birth])
  end 

  def user_params
    params.require(:user).permit(:email, :password,
    user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth], 
    role_attributes: [:role])
  end

end