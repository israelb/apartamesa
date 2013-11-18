class Role < ActiveRecord::Base
  has_and_belongs_to_many :restaurants, :join_table => :restaurants_roles

  belongs_to :resource, :polymorphic => true
  
  scopify
end
