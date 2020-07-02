require 'rails_helper'

RSpec.feature "UserLogin", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario "ログインに成功しログアウトすること" do
    valid_login(user)
    expect(current_path).to eq user_path(user)
    expect(page).not_to have_content "ログイン"
    click_link "ログアウト"
    expect(current_path).to eq root_path
    expect(page).to have_content "ログイン"
  end

  scenario "無効な情報ではログインに失敗すること" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: ""
    fill_in "パスワード", with: ""
    click_button "ログイン"
    expect(current_path).to eq login_path
    expect(page).to have_content "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが正しくありません。"
  end
end
