# We inherited from ActiveRecord does most of the initializations work for us.
class User < ActiveRecord::Base
  # Validating the user :name, :email and the presence of the input.
  validates :name, :email, presence: true
  validates_uniqueness_of :name, :email, case_sensitive: false
  # associations to posts established.
  has_many :posts 
  # Bcrypt gem used to Hash and Salt the Password.
  has_secure_password
end