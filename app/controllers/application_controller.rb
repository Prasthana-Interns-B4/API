class ApplicationController < ActionController::API
  alias_method :current_user, :current_employee
rescue_from StandardError,with: :render_error_response
def render_error_response(exception)
  message = "Error: #{exception.message}"
  render json: { error: message }, status: :internal_server_error
end

  def get_current_employee
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    Employee.find(jwt_payload['sub'])
  end

  rescue_from ActiveRecord::RecordNotSaved do |exception|
    render json: { message: exception.message}
  end

end
