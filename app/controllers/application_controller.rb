class ApplicationController < ActionController::API
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
  
end
