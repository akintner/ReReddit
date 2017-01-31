require 'rails_helper'

RSpec.describe do
  context 'user' do
    before :each do 
      Capybara.app = ReReddit::Application
    end

    scenario 'can redirect to reddit OAuth' do
      VCR.use_cassette("oauth") do
        visit "/"
        stub_omniauth
        expect(page.status_code).to eq(200)

        click_link "Login"
        expect(page.status_code).to eq(200)
        expect(page).to have_content "Welcome to ReReddit"
      end
    end

    def stub_omniauth
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:reddit] = OmniAuth::AuthHash.new(
        {
          provider: 'reddit',
          uid: "777",
          info: {
            email: "akintner@u.rochester.edu",
            name: "Amz",
          },
          credentials: {
            token: ENV["reddit_test_token"]
          }, 
          extra: {
            raw_info: {
              login: "akintner" 
            } 
          }
        } 
      )
    end
  end
end