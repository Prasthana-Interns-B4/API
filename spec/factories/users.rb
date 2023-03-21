FactoryBot.define do
  factory :user do
    emp_id { "PR001" }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    status { "pending" }
  end
end
