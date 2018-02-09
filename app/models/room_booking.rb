class RoomBooking < ApplicationRecord
  belongs_to :room
  belongs_to :booking
  belongs_to :member
end
