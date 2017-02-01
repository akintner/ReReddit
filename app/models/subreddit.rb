class Subreddit < ApplicationRecord
  attr_reader :subreddit_data
  
  def initialize(subreddit_data)
    @subreddit_data = subreddit_data
  end

  def self.by_user(current_user)
    UserService.get_subreddits(current_user).map do |subreddit|
      Subreddit.new(subreddit[:data])
    end
  end

  def display_name
    subreddit_data[:display_name]
  end

  def url
    subreddit_data[:url]
  end
end