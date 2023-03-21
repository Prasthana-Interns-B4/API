class ApplicationController < ActionController::API
  alias_method :current_user, :current_user
  rescue_from PG::NotNullViolation do |exception|
    render json: exception.error
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {status: 404, error: e} # status: 404 => not_found
  end
  rescue_from NoMethodError do |e|
    render json: {status: 500, error: e}, status: 500 # unauthorized
  end
  rescue_from RuntimeError do |e|
    render json: {error: e} # status: 500 => internal_server_error
  end
  rescue_from ActionDispatch::Http::Parameters::ParseError do |exception|
    render json: {error: exception}
  end
	rescue_from CanCan::AccessDenied do |e|
		render json: {error: e}, status: 401 # status: 401 => unauthorized
	end
	rescue_from JWT::ExpiredSignature do |e|
		render json: {error: e.message} # status: 500 => internal_server_error
	end

  def get_current_user
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    User.find(jwt_payload['sub'])
  end

end
