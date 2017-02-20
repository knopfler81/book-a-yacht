class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # customer
  has_many :customer_bookings, class_name: 'Booking'

  # owner
  has_many :yachts
  has_many :owner_bookings, through: :yachts, class_name: 'Booking'
  has_many :reviews, through: :bookings

  # has_attachment  :avatar, accept: [:jpg, :jpeg, :png, :gif]

  validates :last_name, :first_name, presence: true

end
