Hospital.create!(name: "Example Hospital",
          email: "hospital@example.com",
          password: "password",
          password_confirmation: "password",
          address: "東京都千代田区霞が関1丁目3-2",
          phone_number: 1111111111,
          representative: "hogehoge" )

99.times do |n|
  name = Faker::Name.name
  email = "hospital-#{n+1}@example.com"
  password = "password"
  address = "東京都千代田区霞が関1丁目3-2"
  phone_number = 1111111111
  representative = "hogehoge"
  Hospital.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              address: address,
              phone_number: phone_number,
              representative: representative )
end

User.create!(name: "Example User",
        email: "user@example.com",
        password: "password",
        password_confirmation: "password",
        address: "東京都千代田区霞が関1丁目3-2",
        phone_number: 1111111111)

99.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@example.com"
  password = "password"
  address = "東京都千代田区霞が関1丁目3-2"
  phone_number = 1111111111
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              address: address,
              phone_number: phone_number)
end