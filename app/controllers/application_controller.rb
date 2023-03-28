class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: {error: exception},status: :unauthorized
  end

  rescue_from PG::NotNullViolation do |exception|
    render json: {errors: exception.error},status: :not_found
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {status: 401,messages: "No record found"},status: :not_found
  end

   rescue_from PG::ForeignKeyViolation  do |exception|
    render json: {error: exception},status: :not_found
  end

  rescue_from NoMethodError do |exception|
    render json: {error: exception}, status: :method_not_allowed
  end

  rescue_from ActiveRecord::RecordNotSaved do |exception|
    render json: { message: exception.message},status: :bad_request
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: exception.message },status: :bad_request
  end

  def user_authorization
    raise CanCan::AccessDenied.new("Authorization token not present")  if current_user != token_user
  end

  def token_user
    if token_present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
      User.find(jwt_payload['sub'])
    end
  end


  def token_present?
    request.headers['Authorization'].present?
  end

end
