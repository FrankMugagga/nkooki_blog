class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true, length: { 
    maximum: 1000,
    message: "%{count} characters is the maximum allowed" }
  posts_counter, numericality = { only_integer: true }
  validates :password, presence: true
  validates :email, presence:true, uniqueness: true
end
