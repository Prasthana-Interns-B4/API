class UserSignInSerializer < ActiveModel::Serializer
  attributes :id, :emp_id, :email, :auth_token
  has_one :user_detail
  has_one :role
  has_many :devices
end
