class User < ApplicationRecord

  def self.get_scope_data(current_user)
    @user = UserService.get_scope_data(current_user)
  end

  def refresh_token
  end
end
