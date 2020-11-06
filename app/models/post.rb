class Post < ActiveRecord::Base
  # Association to the User table established.
  belongs_to :user
  # Using ActiveRecord Validators
  validates :title, :image_url, :description, presence: true
end
