class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
      user = User.create!(user_params)
      render json: user, status: :created, serializer: UserSerializer
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
       user_detail_attributes: [:first_name, :last_name, :phone_number, :designation, :date_of_birth],
       role_attributes: [:role])
  end
end

