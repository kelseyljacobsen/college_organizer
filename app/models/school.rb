class School
  include Mongoid::Document
  field :name, type: String
  field :city, type: String
  field :state, type: String
  field :website, type: String
  field :total_applicants, type: Integer 
  field :percent_admitted, type: Integer
  field :percent_attending, type: Integer
  field :range_sat_cr, type: String
  field :range_sat_math, type: String
  field :range_sat_writing, type: String
  field :range_act_comp, type: String
  field :average_hs_gpa, type: Float
  field :superscore_sat, type: Boolean
  field :superscore_act, type: Boolean 

  has_many :user_safety_schools
  accepts_nested_attributes_for :user_safety_schools
  has_many :user_target_schools
  accepts_nested_attributes_for :user_target_schools
  has_many :user_reach_schools
  accepts_nested_attributes_for :user_reach_schools


end
