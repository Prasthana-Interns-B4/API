class UserDetailSerializer < ActiveModel::Serializer
  attributes :id,:first_name,:last_name,:phone_number,:designation,:date_of_birth
end
