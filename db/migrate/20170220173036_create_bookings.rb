class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :guests, default: 1
      t.integer :total_price
      t.references :yacht, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
