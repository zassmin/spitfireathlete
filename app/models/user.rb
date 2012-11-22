class User < ActiveRecord::Base
  has_secure_password 
  
  has_many :exercises
  
  has_many :comments, as: :commentable
  
  has_many :microposts, dependent: :destroy, :order => "created_at DESC"
  
  has_many :highfives, as: :highfiveable
  
  has_many :friendships, :foreign_key => "follower_id"
  has_many :friends, :through => :friendships
  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  attr_accessible :name, :email, :password, :password_confirmation, :profile_attributes, :exercises_attributes, :microposts_attributes, :micropost, :about, :image

  validates_uniqueness_of :email

  accepts_nested_attributes_for :exercises, :microposts

  mount_uploader :image, ImageUploader

  def feed
    Micropost.from_users_followed_by(self)
  end
end
