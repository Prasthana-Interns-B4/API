class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

	before_save :remember_employee
  has_one :employee_detail
  has_many :devices
  has_one :role

  ROLES = %w[hr_manager facility_manager employee]

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      self.role.role == role_name
    end
  end

	def remember_employee
		self.remember_created_at = created_at.to_datetime
	end
	
  def jwt_payload
    super
  end


end
