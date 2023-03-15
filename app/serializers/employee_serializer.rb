class EmployeeSerializer < ActiveModel::Serializer
  	attributes :emp_id, :email, :remember_created_at
		has_one :employee_detail
		has_one :role
		has_many :devices
end
