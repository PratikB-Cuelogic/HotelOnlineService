class Booking < ApplicationRecord
has_many :rooms, through: :room_booking
end
