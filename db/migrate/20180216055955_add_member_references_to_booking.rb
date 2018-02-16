class AddMemberReferencesToBooking < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :member, foreign_key: true
  end
end
