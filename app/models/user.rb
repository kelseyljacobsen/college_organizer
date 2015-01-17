class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  has_one :list


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

end
