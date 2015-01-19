class List
  include Mongoid::Document

  field :name, type: String 

  has_many :user_safety_schools
  accepts_nested_attributes_for :user_safety_schools
  has_many :user_target_schools
  accepts_nested_attributes_for :user_target_schools
  has_many :user_reach_schools
  accepts_nested_attributes_for :user_reach_schools
  
end
