class Role < ApplicationRecord
  belongs_to :user

  ROLES = %w[hr_manager facility_manager user]

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end
end
