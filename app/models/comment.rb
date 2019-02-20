class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  
  validates :content, length: { maximum: 500 }
  
  mount_uploader :image, ImageUploader
end