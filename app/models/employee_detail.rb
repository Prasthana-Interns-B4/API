class EmployeeDetail < ApplicationRecord
  belongs_to :employee

  validates :first_name,last_name,presence: true, format: {with: /\A[a-zA-Z]+\z/,
    message: "only allows letters"
  }

 validates :phone_number,presence: true,uniqueness: true,numericality: {only_integer:true},length:{is:10},
 format:{ with: /\A\d{10}\z/, message: "must be 10 digits" }

 validates :designation,presence: true

 validates :date_of_birth,presence: true,date: { before: :today, 
 message: "must be a valid date before today" }


  scope :search,->(type){
    where("first_name Like ? OR last_name Like ? OR phone_number Like ?",
    "%#{type}%","%#{type}%","%#{type}%")
  }

end
