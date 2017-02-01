class SessionsController < ApplicationController

  def create
    @response = request.env["omniauth.auth"]
    auth     = @response
    uid      = auth["uid"]
    username = auth["info"]["name"]
    token    = auth["credentials"]["token"]
    user          = User.find_or_create_by(uid: uid)
    user.username = username
    user.uid      = uid
    user.token    = token
    user.save

    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end