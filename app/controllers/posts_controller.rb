class PostsController < ApplicationController
  def show
    subreddit = Subreddit.find_url(params[:subreddit_name])
    @top_posts = Post.get_posts(subreddit)
  end
end