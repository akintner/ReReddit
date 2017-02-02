class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    current_user ||= User.find(session[:user_id])
  end

  def refresh_token?
    if current_user && current_user.updated_at.to_i < Time.now.to_i
      UserService.refresh_token(current_user)
    end
  end
end
