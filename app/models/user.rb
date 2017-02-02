class User < ApplicationRecord

  def self.get_scope_data(current_user)
    @user = UserService.get_scope_data(current_user)
  end

  # def refresh_token
  #   token = current_user.token
  #   response = Faraday.new("https://oauth.reddit.com/api/v1/me")
  #   response.headers['Authorization'] = "bearer #{current_user.token}"
  # end
end
