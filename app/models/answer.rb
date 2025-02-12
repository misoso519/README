class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
