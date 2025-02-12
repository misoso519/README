class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
