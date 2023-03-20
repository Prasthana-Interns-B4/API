class ApplicationController < ActionController::API

  def token_user
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    User.find(jwt_payload['sub'])
  end


  rescue_from ActiveRecord::RecordNotSaved do |exception|
    render json: { message: exception.message}
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: exception.message }
  end

end
