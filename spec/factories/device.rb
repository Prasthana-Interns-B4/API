FactoryBot.define do
  factory :device_mobile do
    name {Faker::Device.model_name}
    os { Faker::Device.platform }
    device_type {"mobile"}
    category {"Electronics"}
  end

  factory :device do
    name { Faker::Computer.stack }
    os { Faker::Computer.platform }
    device_type {"laptop"}
    category {"Electronics"}
  end
  factory :device_clothing do
    name { Faker::Computer.stack }
    os { Faker::Computer.platform }
    device_type {"clothing"}
    category {"Goodies"}
  end
end
