FactoryBot.define do
  factory :user_detail do
    user
		first_name { 'John' }
		last_name { 'Wick' }
		phone_number { 7896541254 }
		designation { 'employee' }
		date_of_birth { '03-05-1999' }
  end
end
