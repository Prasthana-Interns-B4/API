class UserBasicSerializer < ActiveModel::Serializer
  attributes :id, :emp_id, :email
	has_one :user_detail
	has_one :role
end