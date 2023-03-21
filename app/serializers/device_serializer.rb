# class DeviceSerializer < ActiveModel::Serializer
#   attributes :id,:employee_name,:employee_id,:name,:device_type,:build,:category,:tag,:image_url,:status_of_device

#   def status_of_device
#     if self.object.status == true
#       "Assigned"
#     else
#       "Unassigned"
#     end
#   end
#   def tag
#     Device.find(self.object.id).tag_no
#   end

#   def employee_name
#     if self.object.status == true
#       @employee=EmployeeDetail.find(self.object.employee_id)
#       "#{@employee.first_name +  @employee.last_name}"
#     else
#       "None"
#     end
#   end
# end
