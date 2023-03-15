class ApplicationController < ActionController::API
  alias_method :current_user, :current_employee
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

  def get_current_employee
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    Employee.find(jwt_payload['sub'])
  end

end
