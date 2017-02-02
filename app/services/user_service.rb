class UserService
  def self.get_scope_data(current_user)
    response = Faraday.new("https://oauth.reddit.com/api/v1/me")
    response.headers['Authorization'] = "bearer #{current_user.token}"
    JSON.parse(response.get.body, symbolize_names: true)
  end

  def self.get_subreddits(current_user)
    response = authorized_user(current_user.token).get("/subreddits/mine/subscriber?limit=25")
    subreddits = JSON.parse(response.body, symbolize_names: true)
    subreddits[:data][:children]
  end

  private
    def self.authorized_user(token)
      response = Faraday.new("https://oauth.reddit.com")
      response.headers['Authorization'] = "bearer #{token}"
      response
    end

end