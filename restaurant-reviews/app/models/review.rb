class Review < ApplicationRecord
  # add validations and associations
  validates :restaurant, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  
  belongs_to :restaurant
end
