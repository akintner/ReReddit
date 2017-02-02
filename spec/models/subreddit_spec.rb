require 'rails_helper'

RSpec.describe 'Subreddit' do 
  context 'are made from hash of subreddit_data coming from API' do
    it 'makes new subreddit by calling method get_subreddits' do
      VCR.insert_cassette("oauth") do

        expect(page).to have_content("CONY_KONI is subscribed to the following subreddits:")
        expect(page).to have_content("AWW")

        VCR.eject_cassette("oauth")
      end
    end
  end
end
  