class UserService
  def self.get_scope_data(current_user)
    response = Faraday.new("https://oauth.reddit.com/api/v1/me")
    response.headers['Authorization'] = "bearer #{current_user.token}"
    JSON.parse(response.get.body, symbolize_names: true)
  end

  def self.refresh_token(current_user)
    conn = Faraday.new("https://www.reddit.com")
    conn.basic_auth(ENV["REDDIT_CLIENT_ID"], ENV["REDDIT_CLIENT_SECRET"])
    response = conn.post("/api/v1/access_token", grant_type: "refresh_token", refresh_token: current_user.refresh_token)
    new_data = JSON.parse(response.body, symbolize_names: true)
    user.update_attribute(:token, new_data[:access_token])
  end

  def self.get_subreddits(current_user)
    response = authorized_user(current_user.token).get("/subreddits/mine/subscriber?limit=25")
    subreddits = JSON.parse(response.body, symbolize_names: true)
    subreddits[:data][:children]
  end

  def self.find_subreddit_by_name(subreddit_name)
    response = Faraday.get("https://www.reddit.com/r/#{subreddit_name}/comments/")
    response
  end

  def self.get_posts(subreddit)
    subreddit
  end

  private
    def self.authorized_user(token)
      response = Faraday.new("https://oauth.reddit.com")
      response.headers['Authorization'] = "bearer #{token}"
      response
    end

end