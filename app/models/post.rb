class Post < ActiveRecord::Base
  belongs_to :user

  # using ActiveRecord Validators
  validates :title, :image_url, :description, presence: true
end
