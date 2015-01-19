class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_one :list
  #not sure

  has_many :user_safety_schools
  accepts_nested_attributes_for :user_safety_schools 
  has_many :user_reach_schools
  accepts_nested_attributes_for :user_reach_schools 
  has_many :user_target_schools
  accepts_nested_attributes_for :user_target_schools

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  def lists
    List.find(list_ids)
  end 

  def list_ids
    ret = []
    self.user_lists.each do |r|
      ret << r.list_id if r.list_id
    end 
    ret
  end 

  def list_ids=(list)
    self.save
    self.user_safety_schools.destroy
    self.user_target_schools.destroy
    self.user_reach_schools.destroy
    list.each do |list_id|
      self.user_safety_schools.create(list_id: list_id) unless list_id.blank?
      self.user_target_schools.create(list_id: list_id) unless list_id.blank?
      self.user_reach_schools.create(list_id: list_id) unless list_id.blank?
    end 
  end 

  # def schools
  #   School.find(school_ids)
  # end 

  # def school_ids
  #   ret = []
  #   self.user_schools.each do |r|
  #     ret << r.school_id if r.school_id
  #   end 
  #   ret
  # end 

  # def school_ids=(list)
  #   self.save
  #   self.user_schools.destroy
  #   list.each do |school_id|
  #     self.user_schools.create(school_id: school_id) unless school_id.blank?
  #   end 
  # end 

end
