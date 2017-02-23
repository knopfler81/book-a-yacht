class AddPaimentStatusToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :paiment_status, :boolean, default: false
  end
end
