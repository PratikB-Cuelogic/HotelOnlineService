class Booking < ApplicationRecord
  has_and_belongs_to_many :rooms, :join_table => :bookings_rooms
  belongs_to :member
  validates_presence_of :date,:checkin,:checkout
end
