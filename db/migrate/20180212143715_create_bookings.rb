class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
  end
end
