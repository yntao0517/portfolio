require 'rails_helper'

RSpec.feature "UserPages", type: :feature do
  describe "signup page" do
    before do
      visit signup_path
    end

    it "新規登録ページにユーザー新規登録と書いてあること" do
      expect(page).to have_content "ユーザー新規登録"
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_title full_title('User sign up')
    end
  end
end
