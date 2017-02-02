class Subreddit 
  attr_reader :subreddit_data
  
  def initialize(subreddit_data)
    @subreddit_data = subreddit_data
  end

  def self.by_user(current_user)
    UserService.get_subreddits(current_user).map do |subreddit|
      new(subreddit[:data])
    end
  end

  def name
    subreddit_data[:display_name]
  end

  def url
    subreddit_data[:url]
  end

  def description
    subreddit_data[:public_description]
  end
  
  def total_subscribers
    subreddit_data[:subscribers]
  end

  def rules
    subreddit_data[:submit_text]
  end
end