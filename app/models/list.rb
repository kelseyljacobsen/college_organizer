class List
  include Mongoid::Document

  field :name, type: String 

  has_many :user_safety_schools
  has_many :user_target_schools
  has_many :user_reach_schools
  
end
