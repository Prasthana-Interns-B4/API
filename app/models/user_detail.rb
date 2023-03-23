class UserDetail < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
	validates :phone_number, numericality: true, length: {is: 10}
	validates :first_name, :last_name, presence: true, length: {minimum:3, maximum:20}

	# scope :search_bar, ->(search) {where("first_name ILIKE ? OR last_name ILIKE ?","%#{search}%","%#{search}%")}
=======
     belongs_to :user


   validates :first_name,:last_name,presence: true, format: {with: /\A[a-zA-Z]+\z/,
                                                            message: "only allows letters" }
   validates :phone_number,presence: true,uniqueness: true,numericality: {only_integer:true},length:{is:10},
                                                             format:{ with: /\A\d{10}\z/, message: "must be 10 digits" }
   validates :designation,presence: true

   validates :date_of_birth,presence: true
   
>>>>>>> dev
end
