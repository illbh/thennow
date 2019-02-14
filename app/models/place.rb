class Place < ApplicationRecord
  belongs_to :user

  validates :adress,  presence: true, length: { maximum: 255 }  
  validates :content, length: { maximum: 500 }
end
