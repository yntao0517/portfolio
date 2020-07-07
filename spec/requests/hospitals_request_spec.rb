require 'rails_helper'

RSpec.describe "Hospitals", type: :request do
  let!(:hospital) { FactoryBot.create(:hospital) }

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

  describe "#edit" do
    context "認可された病院の場合" do
      it "正常にレスポンスを返すこと" do
        hospital_sign_in_as hospital
        get edit_hospital_path(hospital)
        expect(response).to be_successful
      end
    end

    context "ログインしていない病院の場合" do
      it "ログイン画面にリダイレクトすること" do
        get edit_hospital_path(hospital)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to hospital_login_path
      end
    end
  end

  describe "#update" do
    context "認可された病院の場合" do
      it "病院を更新できること" do
        hospital_params = FactoryBot.attributes_for(:hospital, name: "NewName")
        hospital_sign_in_as hospital
        patch hospital_path(hospital), params: { id: hospital.id, hospital: hospital_params }
        expect(hospital.reload.name).to eq "NewName"
      end
    end

    context "ログインしていない病院の場合" do
      it "ログイン画面にリダイレクトすること" do
        hospital_params = FactoryBot.attributes_for(:hospital, name: "NewName")
        patch hospital_path(hospital), params: { id: hospital.id, hospital: hospital_params }
        expect(response).to have_http_status "302"
        expect(response).to redirect_to hospital_login_path
      end
    end
  end
end
