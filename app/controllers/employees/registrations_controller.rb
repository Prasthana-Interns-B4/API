# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def respond_with(resource, options = {})
    if request.headers['Authorization'].present?

    else
      resource.create_employee_detail(params.permit(:first_name,:last_name, :phone_number, :designation, :date_of_birth))
    end
  end
end

