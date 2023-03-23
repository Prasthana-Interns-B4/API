class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by!(emp_id: params[:user][:emp_id])
    if user.resign?
      raise CanCan::AccessDenied
    else
      super
    end
  end

  private

  def respond_with(user, options={})
    render json: current_user, status: :ok, serializer: UserSignInSerializer
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