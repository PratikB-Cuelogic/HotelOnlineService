class CreateBookingsRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_rooms do |t|
      t.references :booking, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
