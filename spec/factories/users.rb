FactoryBot.define do
  factory :user do
    emp_id { "PR001" }
    email { Faker::Internet.email }
    password { "Prasthana@2023" }
    status { "pending" }
  end
end
