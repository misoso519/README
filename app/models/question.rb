class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validates :title, :body, presence: true
end
