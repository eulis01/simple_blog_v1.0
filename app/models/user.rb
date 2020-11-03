# we inherited from ActiveRecord does most of the initializations work for us.
class User < ActiveRecord::Base
  has_many :posts # associations to posts established.

  has_secure_password
  validates :email, uniqueness: true
end
