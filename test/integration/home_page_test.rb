require 'test_helper'

class Homepage < ActionDispatch::IntegrationTest
  before { visit root_path }
  describe "reasonable home page" do
    it "looks like it loaded correctly" do
      page.must_have_content("Items")
      page.find_link('New Item').wont_be_nil
      page.find_link('Search').wont_be_nil
    end
  end
end