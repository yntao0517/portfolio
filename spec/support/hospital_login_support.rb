module HospitalLoginSupport
  def hospital_valid_login(hospital)
    visit root_path
    click_link "病院ログイン"
    fill_in "メールアドレス", with: hospital.email
    fill_in "パスワード", with: hospital.password
    click_button "ログイン"
  end
end

RSpec.configure do |config|
  config.include HospitalLoginSupport
end
