class Post < ApplicationRecord
  enum status: { public: 0, private: 1, archived: 2 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :comments_counter, presence: true, numericality: { only_integer: true }
end
