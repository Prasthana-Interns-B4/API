class UserSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  	attributes :id, :emp_id, :email
		has_one :user_detail
		has_one :role
		has_many :devices
=======
  attributes :id,:emp_id,:email
  has_one :user_detail
  has_one :role
  has_many :devices
>>>>>>> dev
end
