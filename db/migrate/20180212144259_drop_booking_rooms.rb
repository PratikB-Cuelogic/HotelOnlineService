class DropBookingRooms < ActiveRecord::Migration[5.1]
  def change
    drop_table :booking_rooms
  end
end
