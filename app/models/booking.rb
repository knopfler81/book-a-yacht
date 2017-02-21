class Booking < ApplicationRecord
  belongs_to :yacht
  belongs_to :user
  has_many :reviews
  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_before_start_date
  validates :guests, inclusion: { in: [1..10]}



  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end
end
