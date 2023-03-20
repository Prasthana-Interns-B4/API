class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
      user = User.create!(user_params)
      user.create_user_detail!(user_detail_params)
      render json: user
  end

  private

  def user_detail_params
    params.permit(:first_name,:last_name, :phone_number, :designation, :date_of_birth)
  end

  def user_params
    params.permit(:email, :password)
  end
end

