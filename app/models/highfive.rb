class Highfive < ActiveRecord::Base
  attr_accessible :highfive
  belongs_to :highfiveable, :polymorphic => true
end
