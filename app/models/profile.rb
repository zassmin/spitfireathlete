class Profile < ActiveRecord::Base
  attr_accessible :about, :tagline
  belongs_to :user

  has_many :comments, as: :commentable
end
