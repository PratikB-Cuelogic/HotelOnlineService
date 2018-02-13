class DropBookingRoom < ActiveRecord::Migration[5.1]
  def change
   drop_table :bookings_rooms
  end
end
