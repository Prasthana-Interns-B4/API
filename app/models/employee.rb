class Employee < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_one :employee_detail, dependent: :destroy
  has_one :role, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,:jwt_authenticatable, jwt_revocation_strategy: self
  def jwt_payload
    super
  end

  STATUSES = %w[pending active resign]

  STATUSES.each do |st|
    define_method "#{st}?" do
      self.status == st
    end
  end

  def create_by_hr_manager(params)
    self.emp_id = "PR#{self.id.to_s.rjust(3, '0')}"
    self.status = "active"
    self.create_employee_detail(params)
    self.create_role
    return self if self.save
  end

  def create_by_employee(params)
    self.create_employee_detail(params)
    self.create_role
    return self if self.save
  end
end
