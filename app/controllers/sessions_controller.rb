class SessionsController < ApplicationController
  def create
    state = params["state"]
    code = params["code"]
    @response = Faraday.post("https://www.reddit.com/api/v1/access_token", "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/auth/reddit/callback")
    token = params["access_token"]
    user_data = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(user_data.body)

    user          = User.find_or_create_by(uid: auth["id"])
    user.username = auth["login"]
    user.uid      = auth["id"]
    user.token    = token
    user.save
    session[:user_id] = user.id

    redirect_to dashboard_index_path
  end

end