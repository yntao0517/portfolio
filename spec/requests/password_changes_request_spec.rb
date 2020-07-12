require 'rails_helper'

RSpec.describe "PasswordChanges", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "#edit" do
    context "ログイン済みのユーザーの場合" do
      it "レスポンスを正しく返すこと" do
        sign_in_as user
        get edit_password_change_path(user)
        expect(response).to be_successful
      end
    end

    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        get edit_password_change_path(user)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end
  end
end
