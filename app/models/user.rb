class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_one :user_detail, dependent: :destroy
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

  def generate_emp_id
    "PR#{self.id.to_s.rjust(3, '0')}"
  end
end
