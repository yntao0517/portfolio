FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    address { "東京都千代田区霞が関1丁目3-2" }
    phone_number { 1234567890 }
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
