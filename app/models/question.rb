class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validates :title, :body, presence: true
  validates :category_id, presence: { message: "カテゴリを選択してください" }
end
