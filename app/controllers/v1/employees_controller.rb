class V1::EmployeesController < ApplicationController
   before_action :find_record, except: [:index]
   def index
    @employees=Employee.all
    render json:@employees
   end

   def show
    render json:@employee
   end

   def update #update by hr
     @employee.employee_detail.update!(hr_params)
      render json:@employee,message:"details updatead" 
   end

   def destroy #soft delete
      @employee.devices.destroy #before destroying removing devices association
      if @employee.update(status:"resigne")
      render json:{message:"employee removed succsussfully" } 
      end     
   end

   def search
   @employee=EmployeeDetail.search(params[:type])
   render json:@employee
   end

   def update_by_employee
      if @employee.employee_detail.update(emp_params)   
      render json:@employee,message:"details updatead" 
      end
   end

   def approve
      render json: {message:"you are approved"} if @employees.update(staus:"active")
   end

   # def reject 
   #    render json: {message: "you are rejectead"} if @employee.destroy
   # end

  def find_record
   @employee=Employee.find(params[:id])
  end

#   def hr_params
#   params.permit(:first_name,:last_name,:phone_number,:date_of_birth)
#   end

#   def emp_params
#    params.permit(:first_name,:last_name,:date_of_birth)
#   end

end