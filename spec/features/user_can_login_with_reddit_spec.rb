require 'rails_helper'

RSpec.describe do
  context 'user' do

    scenario 'can redirect to reddit OAuth and log in' do
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
            name: "Amz",
          },
          credentials: {
            token: "jL8V66ds0TObGLLVt-KemPtntUM"
          }, 
          extra: {
            raw_info: {
              email: "akintner@u.rochester.edu",
            } 
          }
        } 
      )
    end
  end
end