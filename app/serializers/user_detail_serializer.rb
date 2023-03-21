class UserDetailSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :designation, :phone_number, :date_of_birth
end
