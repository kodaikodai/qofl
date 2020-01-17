class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
end