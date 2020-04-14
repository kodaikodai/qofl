class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy

  def self.search(search)
    if search
      Post.where('title LIKE(?)',"%#{search}%")
    else
      Post.all
    end
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end