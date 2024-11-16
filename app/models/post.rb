class Post < ApplicationRecord
  enum status: { published: 0, unlisted: 1, archived: 2 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :comments_counter, numericality: { only_integer: true }
  validates :likes, numericality: { only_integer: true }
end
