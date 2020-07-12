require 'rails_helper'

RSpec.describe "HospitalPasswordChanges", type: :request do
  let(:hospital) { FactoryBot.create(:hospital) }

  describe "#edit" do
    context "ログイン済みの病院の場合" do
      it "レスポンスを正しく返すこと" do
        hospital_sign_in_as hospital
        get edit_hospital_password_change_path(hospital)
        expect(response).to be_successful
      end
    end

    context "ログインしていない病院の場合" do
      it "ログイン画面にリダイレクトすること" do
        get edit_hospital_password_change_path(hospital)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to hospital_login_path
      end
    end
  end
end
