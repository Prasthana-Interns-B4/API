class UserSerializer < ActiveModel::Serializer
  has_one :user_detail
  attributes :id,:emp_id,:email
end
