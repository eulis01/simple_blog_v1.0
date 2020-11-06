# we inherited from ActiveRecord does most of the initializations work for us.
class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates_uniqueness_of :name, :email, case_sensitive: false
  has_many :posts # associations to posts established.

  has_secure_password
end