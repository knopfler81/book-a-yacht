class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  has_attachments :photos, maximum: 10


  validates :name, :price, :length, :capacity, :cabins, :user, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def average_rating
  	sum = 0
  	reviews.each do |review|
  		sum += review.rating
  	end
  	if reviews.count > 0
  		sum /  reviews.count
  	end
  end
end
