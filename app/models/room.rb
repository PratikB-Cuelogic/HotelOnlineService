class Room < ApplicationRecord
  has_and_belongs_to_many :bookings, :join_table => :bookings_rooms
  belongs_to :hotel
  has_many :images, as: :imageable, dependent: :destroy
  validates :price, presence: true,  numericality: { :greater_than_or_equal_to => 1,
													:less_than_or_equal_to => 99999,
													:message => "should be between 1 and 99999."}
  validates :no_of_bedroom,:hotel_id, presence: true
  
  accepts_nested_attributes_for :images, allow_destroy: true
  
  scope :inactive, ->{where.not(inactive: nil)}
  scope :active, ->{where(inactive: nil)}
  scope :checkin_checkout, -> (checkin, checkout){ joins(:bookings).where("bookings.checkin < ? AND bookings.checkout > ? ", "#{checkout}" , "#{checkin}") }
  scope :room_hotel_id, -> (id){ joins(:hotel).where( rooms: {"hotel_id": id })}
  scope :room_id_not, ->  (query){ where.not( "id": query ) }
  scope :id, ->(id){ where("id": id)}
  scope :booking_date, -> (date){ joins(:bookings).where("bookings.date = ? ", "#{date}" ) }
  scope :booking_member_id, -> (member_id){ where("bookings.member_id = ? ", "#{member_id}" ) }
  scope :checkin_checkout_eq, -> (checkin, checkout){ joins(:bookings).where("bookings.checkin = ? AND bookings.checkout = ? ", "#{checkin}" , "#{checkout}") }
end
