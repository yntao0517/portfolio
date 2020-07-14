require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:base_title) { "Coid" }

  describe "Home page" do
    it "gets root" do
      get root_path
      expect(response).to have_http_status(:success)
      assert_select 'title', "#{base_title}"
    end

    it "gets /about" do
      get about_path
      expect(response).to have_http_status(:success)
      assert_select 'title', "About | #{base_title}"
    end
  end
end
