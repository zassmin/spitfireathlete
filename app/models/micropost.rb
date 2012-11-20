class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :highfives, as: :highfiveable
end
