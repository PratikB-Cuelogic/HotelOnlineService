class DropRoomBookingTable < ActiveRecord::Migration[5.1]
  def change
	drop_table :room_bookings
  end
end