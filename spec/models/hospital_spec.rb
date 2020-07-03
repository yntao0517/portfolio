require 'rails_helper'

RSpec.describe Hospital, type: :model do
  let(:hospital) { FactoryBot.create(:hospital) }

  it "有効なファクトリを持つこと" do
    expect(hospital).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    hospital.name = nil
    expect(hospital).not_to be_valid
  end

  it "メールアドレスがなければ無効な状態あること" do
    hospital.email = nil
    expect(hospital).not_to be_valid
  end

  it "名前が長すぎると無効な状態であること" do
    hospital.name = "a" * 51
    expect(hospital).not_to be_valid
  end

  it "メールアドレスが長すぎると無効な状態であること" do
    hospital.email = "a" * 244 + "@example.com"
    expect(hospital).not_to be_valid
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:hospital, email: "hospital@example.com")
    hospital = FactoryBot.build(:hospital, email: "hospital@example.com")
    hospital.email.upcase
    hospital.valid?
    expect(hospital.errors[:email]).to include("has already been taken")
  end

  it "有効なメールアドレスは有効であること" do
    valid_addresses = %w(hospital@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn)
    valid_addresses.each do |valid_address|
      hospital.email = valid_address
      expect(hospital).to be_valid
    end
  end

  it "無効なメールアドレスは無効であること" do
    invalid_addresses = %w(
      hospital@example,com hospital_at_foo.org
      hospital.name@example. foo@bar_baz.com foo@bar+baz.com
    )
    invalid_addresses.each do |invalid_address|
      hospital.email = invalid_address
      expect(hospital).not_to be_valid
    end
  end

  it "メールアドレスは小文字で保存されること" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    hospital.email = mixed_case_email
    hospital.save
    expect(hospital.email.downcase).to eq hospital.reload.email
  end

  it "住所が長すぎると存在できないこと" do
    hospital.address = "a" * 151
    expect(hospital).not_to be_valid
  end

  it "住所がなければ無効であること" do
    hospital.address = ""
    expect(hospital).not_to be_valid
  end

  it "電話番号がなければ無効であること" do
    hospital.phone_number = nil
    expect(hospital).not_to be_valid
  end

  it "電話番号が数字でなければ無効であること" do
    hospital.phone_number = "a" * 10
    expect(hospital).not_to be_valid
  end

  it "代表者がいなければ無効であること" do
    hospital.representative = nil
    expect(hospital).not_to be_valid
  end

  it "代表者名が長すぎると無効であること" do
    hospital.representative = "a" * 51
    expect(hospital).not_to be_valid
  end
end
