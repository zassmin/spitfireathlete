class User < ActiveRecord::Base
  has_secure_password 
  has_one :profile
  has_many :exercises
  has_many :comments, as: :commentable
  has_many :microposts, dependent: :destroy

  attr_accessible :name, :email, :password, :password_confirmation, :profile_attributes, :exercises_attributes, :microposts_attributes, :micropost

  validates_uniqueness_of :email

  accepts_nested_attributes_for :profile, :exercises, :microposts
end
