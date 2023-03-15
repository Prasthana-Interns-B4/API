class Employees::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(employee, options={})
    render json: {
        status: {code: 200, message: "user Signed in successfully", data: current_employee}
      }, status: :ok
  end

  def respond_to_on_destroy
    current_employee = get_current_employee
    if current_employee
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
