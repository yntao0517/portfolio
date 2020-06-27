require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:base_title) {"Coid"}

  describe "GET /home" do
    it "should get root" do
      get "/"
      expect(response).to have_http_status(:success)
      assert_select 'title', "#{base_title}"
    end

    it "returns http success" do
      get "/static_pages/home"
      expect(response).to have_http_status(:success)
      assert_select 'title', "#{base_title}"
    end
  end

end
