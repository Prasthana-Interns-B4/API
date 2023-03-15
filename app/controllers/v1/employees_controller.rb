class V1::EmployeesController < ApplicationController

	# PUT/PATCH employees/forgot_password or employees/forgot_password.json
	def forgot_password
		@employee = Employee.where(email: params[:email], emp_id: params[:emp_id])
		if @employee.present?
			@employee.update(password: "Prasthana@2023")
			render json: {message: "Your password has been updated to default password"}, status: :200
		else
			render json: {message: "email or emp_id does not exist"}, status: :400
	end

	# PUT/PATCH employees/reset_password or employees/reset_password.json
	def reset_password
		current_employee.update(params.permit(:password))
	end
end