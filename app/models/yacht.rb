class Yacht < ApplicationRecord
  belongs_to :user

  has_many :owner_bookings, class_name: 'Booking'

  has_many :reviews, through: :owner_bookings

  has_attachments :photos, maximum: 10


  validates :name, :price, :length, :capacity, :cabins, :user, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?


  def available_at(date_range)
    available = true
    self.owner_bookings.each do |booking|
      available = false if ((booking.start_date..booking.end_date).to_a & date_range.to_a).present?
    end
    available
  end

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
