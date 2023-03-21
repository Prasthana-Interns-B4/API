class ApplicationController < ActionController::API
  include ActionController::Serialization

  # rescue_from StandardError,with: :render_error_response
  # def render_error_response(exception)
  #   message = "Error: #{exception.message}"
  #   render json: { error: message }, status: :internal_server_error
  # end
  
 
  def token_user
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    User.find(jwt_payload['sub'])
  end

  def token_present?
    request.headers['Authorization'].present?
  end
  def authenticate_user
    if token_present?
      render json: { messaege: "You are Not Authorized"}, status: 402 if current_user != token_user
    end
  end



end
