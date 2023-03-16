class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    if token_present? && current_user&.role.hr_manager?
      user = User.create(get_user_params)
      if user.persisted?
        @user = user.create_by_hr_manager(permit_params)
        sign_up(:user, current_user)
        render json: @user
      else
        render json: { error: user.errors.full_messages }
      end
    else
      user = User.create(get_user_params)
      if user.persisted?
        @user = user.create_by_user(permit_params)
        render json: @user
      else
        render json: { error: user.errors.full_messages }
      end
    end
  end

  def sign_up(resource_name, resource)
    super
  end
  private

  def permit_params
    params.permit(:first_name,:last_name, :phone_number, :designation, :date_of_birth)
  end

  def token_present?
    request.headers['Authorization'].present?
  end

  def get_user_params
    params.permit(:email, :password)
  end
end
