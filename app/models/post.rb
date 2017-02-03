class Post
  def initialize(post_data)
    @post = post_data
  end

  def self.get_posts(subreddit_path)
    UserService.get_posts(subreddit_path)
  end
end
