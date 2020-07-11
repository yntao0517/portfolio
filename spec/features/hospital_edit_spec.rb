require 'rails_helper'

RSpec.feature "Hospital edit", type: :feature do
  let(:hospital) { FactoryBot.create(:hospital) }

  scenario "病院は編集に成功する" do
    hospital_valid_login(hospital)
    visit hospital_path(hospital)
    click_link "プロフィール変更"

    fill_in "メールアドレス", with: "edit@example.com"
    fill_in "電話番号", with: "2222222222"
    fill_in "住所", with: "東京都千代田区霞が関2丁目3-2"
    fill_in "代表者", with: "rails"
    click_button "プロフィール更新"
    expect(current_path).to eq hospital_path(hospital)
    expect(hospital.reload.email).to eq "edit@example.com"
    expect(hospital.reload.address).to eq "東京都千代田区霞が関2丁目3-2"
    expect(hospital.reload.phone_number).to eq 2222222222
    expect(hospital.reload.representative).to eq "rails"
  end

  scenario "病院は編集に失敗する" do
    hospital_valid_login(hospital)
    visit hospital_path(hospital)
    click_link "プロフィール変更"
    fill_in "メールアドレス", with: "foo@invalid"
    click_button "プロフィール更新"
    expect(hospital.reload.email).not_to eq "foo@invalid"
  end
end
