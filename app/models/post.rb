class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  belongs_to :user
end