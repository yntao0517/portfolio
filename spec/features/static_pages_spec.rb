require 'rails_helper'

RSpec.feature "StaticPages", type: :feature do
  describe "HomePage" do
    before do
      visit root_path
    end

    it "タイトルが正しく表示されていること" do
      expect(page).to have_content full_title('')
    end
  end
end
