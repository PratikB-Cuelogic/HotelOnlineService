class Hotel < ApplicationRecord
  has_many :rooms,  dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  
  name_regex=/\A[a-zA-Z][a-zA-Z ?]+\z/;
  
  validates :name, presence: { message: "it should have proper hotel name" }, allow_blank: false, format: {with: name_regex, message: 'Name does not contain special characters and digits'}
  validates :rating, presence: true, allow_blank: true,length: { in: 0..5, message: "it should have have value between 0 to 5" }
  validates :location, presence: { message: "it should have proper Location details" }
  validates :state, :city, presence: { message: "can't be blank" }
  
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :name_state_city, -> (name){ where("((name ILIKE ? OR state ILIKE ?) OR city ILIKE ?)", "#{name}%", "#{name}%", "#{name}%")} 
  scope :room_inactive, -> { joins(:rooms).where(rooms: { inactive: nil} )}
  scope :room_id_not, ->  (query){ where.not( "rooms.id": query ) }
  scope :id, -> (id){ where("id": id)}
  scope :room_count, -> (room_count){ group("hotels.id").having(" count(rooms.id) >= ?", room_count)}
end
