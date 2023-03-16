class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    if token_present? && current_user&.role.hr_manager?
      user = User.create(user_params)
      emp_id = user.generate_emp_id
      user.update(emp_id: emp_id)
      user.create_user_detail(user_detail_params)
      render json: user
    else
      user = User.create(user_params)
      user.create_user_detail(user_detail_params)
      render json: user
    end
  end
  private

  def user_detail_params
    params.permit(:first_name,:last_name, :phone_number, :designation, :date_of_birth)
  end

  def token_present?
    request.headers['Authorization'].present?
  end

  def user_params
    parameters = params.permit(:email, :password)
    parameters.merge!(status: "active") if token_present?
    parameters
  end
end

