class UserTargetSchool
  include Mongoid::Document

  belongs_to :user  
  belongs_to :school 
  belongs_to :list
  
end
