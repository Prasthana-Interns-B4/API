class UserSerializer < ActiveModel::Serializer
  	attributes :id, :emp_id, :email
		has_one :user_detail
		has_one :role
		has_many :devices
end
