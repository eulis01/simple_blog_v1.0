class User < ActiveRecord::Base
  has_many :posts
  # => using ActiveRecord macro to do validations.
  has_secure_password 
end
