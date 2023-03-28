FactoryBot.define do
  factory :device do
    name {Faker::Device.model_name}
    os {Faker::Device.platform}
    device_type {"Mobile"}
    category {"Electronics"}
  end
end
