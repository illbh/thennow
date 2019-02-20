class Place < ApplicationRecord
  belongs_to :user

  validates :adress,  presence: true, length: { maximum: 255 }  
  validates :content, length: { maximum: 500 }
  
  has_many :comments
  has_many :posts, through: :comments, source: :comment
  
  mount_uploader :image, ImageUploader
end
