class Booking < ApplicationRecord
has_and_belongs_to_many :rooms

validates_presence_of :date,:checkin,:checkout

end
