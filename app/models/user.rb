class User< ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_one  :user_detail, dependent: :destroy
  has_one  :role, dependent: :destroy
  has_many :devices, dependent: :nullify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :jwt_authenticatable, jwt_revocation_strategy: self
  accepts_nested_attributes_for :user_detail, :role, update_only: true
  validates :email,presence:true,uniqueness: true
  validates :status, inclusion: {in: %w[active pending resign]}
  before_create :set_password


  scope :search, ->(search) { search.present? ?
    joins(:user_detail).where("first_name ILIKE ? OR last_name ILIKE ? OR CAST(phone_number AS TEXT) ILIKE ?",
     "%#{search}%", "%#{search}%", "%#{search}%").where(status: "active") : where(status: "active").order(id: "DESC")
    }

  def set_password
    self.encrypted_password = password_digest("Prasthana@2023")
  end

  def on_jwt_dispatch(token, payload)
    @auth_token = token
  end

  STATUSES = %w[pending active resign]
  STATUSES.each do |st|
    define_method "#{st}?" do
      self.status == st
    end
  end

  ROLES = %w[hr_manager facility_manager employee]

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
     self.role.role == role_name
    end
  end

  def jwt_payload
   super
  end

  def approve_user
    self.update!(emp_id: "PR#{self.id.to_s.rjust(3, '0')}",status: "active")
  end

	def discard_user
		if active?
			devices.delete_all
			update!(status: "resign")
		elsif pending?
			destroy
		else
			raise CanCan::AccessDenied.new("Not an active user")
		end
	end

  def auth_token
    @auth_token
  end

end
