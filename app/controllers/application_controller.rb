class ApplicationController < ActionController::API
  rescue_from PG::NotNullViolation do |exception|
    render json: exception.error
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {messages: "No record found"}
  end
end
