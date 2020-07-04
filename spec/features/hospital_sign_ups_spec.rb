require 'rails_helper'

RSpec.feature "HospitalSignUps", type: :feature do
  include ActiveJob::TestHelper

  scenario "病院はアカウント作成に成功する" do
    visit root_path
    click_link "病院新規登録"

    perform_job do
      expect do
        fill_in "名前", with: "hospital"
        fill_in "メールアドレス", with: "hospital@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        fill_in "住所", with: "東京都千代田区霞が関1丁目3-2"
        fill_in "電話番号", with: "1111111111"
        fill_in "代表者", with: "hogehoge"
        click_button "アカウント作成"
      end.to change(Hospital, :count).by(1)
    end
  end
end
