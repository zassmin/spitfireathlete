class AddIndexesToFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, :friend_id
    add_index :friendships, :follower_id
  end
end
