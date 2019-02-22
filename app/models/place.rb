class Place < ApplicationRecord
  belongs_to :user

  validates :adress,  presence: true, length: { maximum: 255 }
  #validates :content, length: { maximum: 500 }
  #validates :image_date,presence: true
  #validates :image, presence: true
  
  has_many :comments,  dependent: :destroy
  has_many :posts, through: :comments, source: :comment
  
  mount_uploader :image, ImageUploader
  
  accepts_nested_attributes_for :comments, allow_destroy: true
end
