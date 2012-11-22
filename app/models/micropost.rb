class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user

  has_many :highfives, as: :highfiveable

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT friend_id FROM friendships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
