class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place, optional: true
  
  validates :content, length: { maximum: 500 }
  validates :image_date, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
end