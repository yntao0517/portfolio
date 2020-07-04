require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:hospital) { FactoryBot.create(:hospital) }

  scenario "ログインに成功すること" do
    hospital_valid_login(hospital)
    expect(current_path).to eq hospital_path(hospital)
    expect(page).not_to have_content "ログイン"
  end

  scenario "無効な情報ではログインに失敗すること" do
    visit root_path
    click_link "病院ログイン"
    fill_in "メールアドレス", with: ""
    fill_in "パスワード", with: ""
    click_button "ログイン"

    expect(current_path).to eq hospital_login_path
    expect(page).to have_content "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが正しくありません。"
  end
end
