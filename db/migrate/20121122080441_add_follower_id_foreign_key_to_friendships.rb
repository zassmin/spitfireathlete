class AddFollowerIdForeignKeyToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :follower_id, :integer 
  end
end
