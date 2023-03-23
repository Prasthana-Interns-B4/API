class UserSerializer < ActiveModel::Serializer
  has_one :user_detail
  has_one :role
  has_many :devices
  attributes :id,:emp_id,:email
end
