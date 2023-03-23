class ApplicationController < ActionController::API

  def token_user
    if token_present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
      User.find(jwt_payload['sub'])
    end
  end

  def token_present?
    request.headers['Authorization'].present?
  end
  def authenticate_user
    if token_present?
      render json: { message: "You are Not Authorized"}, status: 402 if current_user != token_user
    end
  end


  # rescue_from PG::NotNullViolation do |exception|
  #   render json: exception.error
  # end
  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   render json: {status: 401,messages: "No record found"},status: 401
  # end
  # rescue_from NoMethodError do |e|
  #   render json: {status: 401,message: "No Record Found"},status: 401
  # end
  # rescue_from RuntimeError do |e|
  #   render json: {error: e.error}
  # end
  # rescue_from ActionDispatch::Http::Parameters::ParseError do |exception|
  #   render json: {error: "passing parameters passing format"}
  # end

  
end
