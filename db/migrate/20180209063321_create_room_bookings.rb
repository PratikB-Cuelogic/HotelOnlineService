class CreateRoomBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :room_bookings do |t|
      t.references :room, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :member, foreign_key: true
      t.date :checkin
      t.date :checkout
      t.date :bdate

      t.timestamps
    end
  end
end
