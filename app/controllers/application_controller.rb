class ApplicationController < ActionController::API
   #can can can gem passing mass params
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {status: :forbidden ,exception: exception},status: 401
  end
  rescue_from PG::NotNullViolation do |exception|
    render json: {errors: exception.error},status: 404
  end
  rescue_from ActiveRecord::RecordNotFound || NoMethodError do |exception|
    render json: {status: 401,messages: "No record found"},status: 405
  end
  rescue_from RuntimeError do |e|
    render json: {error: e},status: 409
  end


  def user_authorization
    raise "You are not authorize or Token not present." if current_user != token_user
  end

  def token_user
     if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
      User.find(jwt_payload['sub'])
     else
      raise "You are not authorize or Token not present."
     end
  end
end
