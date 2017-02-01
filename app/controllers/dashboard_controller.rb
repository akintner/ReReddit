class DashboardController < ApplicationController
  def index
    @user = User.get_scope_data(current_user)
    @subreddits = Subreddit.by_user(current_user)
  end

end