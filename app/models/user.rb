class User < ApplicationRecord
  validates :name, presence: true, length: { maximum:30 }
  validates :email, presence: true, length: { maximum:255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  with_options unless: :id? do
    validates :password, presence: true, length: { minimum:8 }
  end
  mount_uploader :image, ImageUploader
  has_many :articles
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
end
