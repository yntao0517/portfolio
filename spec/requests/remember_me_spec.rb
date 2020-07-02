require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  let(:user) { FactoryBot.create(:user) }

  it "ログイン中のみログアウトすること" do
    sign_in_as(user)
    expect(response).to redirect_to user_path(user)
    delete logout_path
    expect(response).to redirect_to root_path
    expect(session[:user_id]).to eq nil
    delete logout_path
    expect(response).to redirect_to root_path
    expect(session[:user_id]).to eq nil
  end

  context "ログインでremember_meのチェックをしているとき" do
    it "cookiesを覚えていること" do
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      expect(response.cookies['remember_token']).to_not eq nil
    end
  end

  context "ログインでremember_meのチェックをしていないとき" do
    it "cookiesを覚えていないこと" do
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      delete logout_path
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '0'} }
      expect(response.cookies['remember_token']).to eq nil
    end
  end
end