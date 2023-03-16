class ApplicationController < ActionController::API
  alias_method :current_user, :current_user

  def get_current_user
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secret_key_base).first
    User.find(jwt_payload['sub'])
  end


  rescue_from ActiveRecord::RecordNotSaved do |exception|
    render json: { message: exception.message}
  end

end
