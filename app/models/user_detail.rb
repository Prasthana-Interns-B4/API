class UserDetail < ApplicationRecord
  belongs_to :user
	validates :phone_number, numericality: true, length: {is: 10}
	validates :first_name, :last_name, presence: true, length: {minimum:3, maximum:20}
end
