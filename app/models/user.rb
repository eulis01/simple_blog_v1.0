# we inherited from ActiveRecord does most of the initializations work for us.
class User < ActiveRecord::Base
  has_many :posts # associations to posts established.
  # using bcrypt macro to hash and secure the password
  has_secure_password
end
