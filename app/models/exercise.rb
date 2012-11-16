class Exercise < ActiveRecord::Base
  attr_accessible :exercise_name, :exercise_prescription
  belongs_to :user

  has_many :comments, as: :commentable
end
