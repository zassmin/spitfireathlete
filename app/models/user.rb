class User < ActiveRecord::Base
  has_secure_password 
  has_many :exercises
  has_many :comments, as: :commentable
  has_many :microposts, dependent: :destroy
  has_many :highfives, as: :highfiveable

  attr_accessible :name, :email, :password, :password_confirmation, :profile_attributes, :exercises_attributes, :microposts_attributes, :micropost, :about

  validates_uniqueness_of :email

  accepts_nested_attributes_for :exercises, :microposts
end
