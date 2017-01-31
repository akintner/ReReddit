require 'rails_helper'

RSpec.describe do
  context 'visitor' do
    before do 
      visit root_path
    end

    scenario 'sees the root page' do
      expect(page).to have_content "Welcome to ReReddit, please login with Reddit"
    end

    scenario 'can see button to login with reddit' do
      expect(page).to have_link "Login"
    end

  end
end