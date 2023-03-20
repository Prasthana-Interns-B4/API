class ApplicationController < ActionController::API
  include ActionController::Serialization

  rescue_from StandardError,with: :render_error_response
  def render_error_response(exception)
    message = "Error: #{exception.message}"
    render json: { error: message }, status: :internal_server_error
  end
  
  rescue_from PG::NotNullViolation do |exception|
    render json: exception.error
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {status: 401,messages: "No record found"},status: 401
  end
  rescue_from NoMethodError do |e|
    render json: {status: 401,message: "No Record Found"},status: 401
  end
  rescue_from RuntimeError do |e|
    render json: {error: e.error}
  end
  rescue_from ActionDispatch::Http::Parameters::ParseError do |exception|
    render json: {error: "passing parameters passing format"}
  end

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
