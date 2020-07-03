FactoryBot.define do
  factory :hospital do
    name { "hospital" }
    sequence(:email) { |n| "hospital#{n}@example.com" }
    address { "東京都千代田区霞が関1丁目3-2" }
    phone_number { 1111111111 }
    representative { "hogehoge" }
  end
end
