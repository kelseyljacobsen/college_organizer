class List
  include Mongoid::Document

  belongs_to :user
  
end
