require 'rails_helper'

RSpec.feature "UserEdit", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario "ユーザーは編集に成功する" do
    valid_login(user)
    visit user_path(user)
    click_link "プロフィール変更"
    fill_in "名前", with: "edit"
    fill_in "メールアドレス", with: "edit@example.com"
    fill_in "住所", with: "東京都千代田区霞が関2丁目1-2"
    fill_in "電話番号", with: "987654321"
    click_button "プロフィール更新"
    expect(current_path).to eq user_path(user)
    expect(user.reload.email).to eq "edit@example.com"
    expect(user.reload.address).to eq "東京都千代田区霞が関2丁目1-2"
    expect(user.reload.phone_number).to eq 987654321
  end

  scenario "ユーザーは編集に失敗する" do
    valid_login(user)
    visit user_path(user)
    click_link "プロフィール変更"
    fill_in "メールアドレス", with: "foo@invalid"
    fill_in "住所", with: ""
    fill_in "電話番号", with: ""
    click_button "プロフィール更新"
    expect(current_path).to eq user_path(user)
    expect(user.reload.email).not_to eq "foo@invalid"
  end
end
