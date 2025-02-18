class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  validates :name, presence: true
  mount_uploader :profile_picture, ProfilePictureUploader
end