class EmployeeDetail < ApplicationRecord
  belongs_to :employee
	validates :phone_number, length: {is: 10}
	validates :first_name, :last_name, :designation, presence: true, length: {minimum:3}
end
