class Employees::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    if token_present? && current_employee&.role.hr_manager?
      employee = Employee.create(get_employee_params)
      if employee.persisted?
        @employee = employee.create_by_hr_manager(permit_params)
        sign_up(:employee, current_employee)
        render json: @employee
      else
        render json: { error: employee.errors.full_messages }
      end
    else
      employee = Employee.create(get_employee_params)
      if employee.persisted?
        @employee = employee.create_by_employee(permit_params)
        render json: @employee
      else
        render json: { error: employee.errors.full_messages }
      end
    end
  end

  def sign_up(resource_name, resource)
    super
  end
  private

  def permit_params
    params.permit(:first_name,:last_name, :phone_number, :designation, :date_of_birth)
  end

  def token_present?
    request.headers['Authorization'].present?
  end

  def get_employee_params
    params.permit(:email, :password)
  end
end

