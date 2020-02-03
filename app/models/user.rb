class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  validates :nickname, presence: true, length: { maximum: 9 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
