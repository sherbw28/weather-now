class Weather < ApplicationRecord
  
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :location, presence: true, length: { maximum: 255 }
end
