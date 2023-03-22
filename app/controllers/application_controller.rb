class ApplicationController < ActionController::API

  def token_user
    if token_present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
      User.find(jwt_payload['sub'])
    end
  end


  rescue_from ActiveRecord::RecordNotSaved do |exception|
    render json: { message: exception.message}
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: exception.message }
  end

  def token_present?
    request.headers['Authorization'].present?
  end

end
