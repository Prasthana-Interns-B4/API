class UserDetail < ApplicationRecord
   belongs_to :user


   validates :first_name,:last_name,presence: true
   validates :phone_number,presence: true,uniqueness: true,numericality: {only_integer:true},length:{is:10},
                                                             format:{ with: /\A\d{10}\z/, message: "must be 10 digits" }
   validates :designation,presence: true

   validates :date_of_birth,presence: true

end
