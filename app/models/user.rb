class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  # creates an array of safety schools, an array of target schools, and an array of reach schools that are part of each user
  field :safety_schools, type: Array
  field :target_schools, type: Array
  field :reach_schools, type: Array


  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  
  # ensures the password is secure
  has_secure_password

end
