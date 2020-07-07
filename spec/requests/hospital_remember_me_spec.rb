require 'rails_helper'

RSpec.describe "Hospital remember me", type: :request do
  let(:hospital) { FactoryBot.create(:hospital) }

  it "ログイン中のみログアウトすること" do
    hospital_sign_in_as(hospital)
    expect(response).to redirect_to hospital_path(hospital)
    delete hospital_logout_path
    expect(response).to redirect_to root_path
    expect(session[:hospital_id]).to eq nil
    delete hospital_logout_path
    expect(response).to redirect_to root_path
    expect(session[:hospital_id]).to eq nil
  end

  context "ログインでremember_meのチェックをしているとき" do
    it "cookiesを覚えていること" do
      post hospital_login_path, params: { session: {
        email: hospital.email,
        password: hospital.password,
        remember_me: '1',
      } }
      expect(response.cookies['remember_token']).not_to eq nil
    end
  end

  context "ログインでremember_meのチェックをしていないとき" do
    it "cookiesを覚えていないこと" do
      post hospital_login_path, params: { session: {
        email: hospital.email,
        password: hospital.password,
        remember_me: '1',
      } }
      delete hospital_logout_path
      post hospital_login_path, params: { session: {
        email: hospital.email,
        password: hospital.password,
        remember_me: '0',
      } }
      expect(response.cookies['remember_token']).to eq nil
    end
  end
end
