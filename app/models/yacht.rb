class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  has_attachments :photos, maximum: 10

  validates :name, :price, :length, :capacity, :cabins, presence: true
end
