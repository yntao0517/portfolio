require 'rails_helper'

RSpec.describe "Hospitals", type: :request do
  let(:hospital) { FactoryBot.create(:hospital) }

  describe "GET /new" do
    it "returns http success" do
      get new_hospital_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    context "ログイン済みの病院の場合" do
      it "正常なレスポンスを返すこと" do
        hospital_sign_in_as hospital
        get hospital_path(hospital)
        expect(response).to be_successful
      end
    end
  end
end
