class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, :description, presence: true
end
