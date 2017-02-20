class Yacht < ApplicationRecord
  belongs_to :user
  validates :name, :price, :length, :capacity, :cabins, presence: true
end
