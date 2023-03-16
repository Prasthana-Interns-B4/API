class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(user, options={})
    render json: {
        status: {code: 200, message: "user Signed in successfully", data: current_user}
      }, status: :ok
  end

  def respond_to_on_destroy
    current_user = token_user
    if current_user
      render json: {
        status: 200,
        message: "Signed out successfully"
      },
      status: :ok
    else
      render json: {
        status: 401,
        message: "User has no Active Session"
      },
      status: :unathorized
    end
  end
end
