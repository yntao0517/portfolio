require 'rails_helper'

RSpec.feature "UserSignUps", type: :feature do
  include ActiveJob::TestHelper

  scenario "ユーザーが新規登録に成功する" do
    visit root_path
    click_link "新規登録"

    perform_job do
      expect {
        fill_in "名前",           with: "Test"
        fill_in "メールアドレス", with: "hogehoge@example.com"
        fill_in "パスワード",     with: "password"
        fill_in "パスワード確認", with: "password"
        fill_in "住所",           with: "東京都千代田区霞が関1丁目3-2"
        fill_in "電話番号",       with: 1234567890
    }.to change(User, :count).by(1)
    end
  end
end