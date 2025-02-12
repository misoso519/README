class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :questions, dependent: :destroy
  validates :name, presence: true
end