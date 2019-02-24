class Place < ApplicationRecord
  belongs_to :user

  validates :adress,  presence: true, length: { maximum: 255 }
  
  has_many :comments,  dependent: :destroy
  has_many :posts, through: :comments, source: :comment
  
  accepts_nested_attributes_for :comments, allow_destroy: true
end
