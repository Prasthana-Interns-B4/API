class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by!(emp_id: params[:user][:emp_id])
    if user.resign?
      render json: { message: "You are not allowed here" }, status: :unauthorized
    else
      super
    end
  end
  private

  def respond_with(user, options={})
    render json: current_user, status: :ok
  end

  def respond_to_on_destroy
    current_user = token_user
    if current_user
      render json: { message: "Signed out successfully" }, status: :ok
    else
      render json: { message: "User has no Active Session" }, status: :unauthorized
    end
  end
end