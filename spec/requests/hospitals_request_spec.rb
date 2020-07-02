require 'rails_helper'

RSpec.describe "Hospitals", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get hospitals_signup_path
      expect(response).to have_http_status(:success)
    end
  end

end
