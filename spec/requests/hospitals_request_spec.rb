require 'rails_helper'

RSpec.describe "Hospitals", type: :request do
  let(:hospital) { FactoryBot.create(:hospital) }

  describe "GET /new" do
    it "returns http success" do
      get new_hospital_path
      expect(response).to have_http_status(:success)
    end
  end
end
