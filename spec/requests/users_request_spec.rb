require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }

  describe "GET /new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    context "ログイン済みのユーザーとして" do
      it "正常なレスポンスを返すこと" do
        sign_in_as user
        get user_path(user)
        expect(response).to be_successful
      end
    end
  end

  describe "#edit" do
    context "認可されたユーザーの場合" do
      it "正常にレスポンスを返すこと" do
        sign_in_as user
        get edit_user_path(user)
        expect(response).to be_successful
      end
    end

    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        get edit_user_path(user)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context "アカウントが違うユーザーの場合" do
      it "ホーム画面にリダイレクトすること" do
        sign_in_as other_user
        get edit_user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#update" do
    context "認可されたユーザーの場合" do
      it "ユーザーを更新できること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as user
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(user.reload.name).to eq "NewName"
      end
    end

    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context "アカウントが違うユーザーの場合" do
      it "ユーザーを更新できないこと" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as other_user
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(user.reload.name).to eq other_user.name
      end

      it "ホーム画面にリダイレクトすること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as other_user
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#destroy" do
    it "ユーザーを削除できること" do
      sign_in_as user
      expect do
        delete user_path(user), params: { id: user.id }
      end.to change(User, :count).by(-1)
    end
  end
end
