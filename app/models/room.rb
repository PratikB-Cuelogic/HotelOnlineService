class Room < ApplicationRecord
belongs_to :hotel
validates :price, :no_of_bedroom, presence: true

end
