class Room < ApplicationRecord
belongs_to :hotel
has_many :images, as: :imageable
validates :price, presence: true,  numericality: {  :only_integer => true ,  
													:greater_than_or_equal_to => 1,
													:less_than_or_equal_to => 99999,
													:message => "should be between 1 and 99999."}



validates :no_of_bedroom,:hotel_id, presence: true
end
