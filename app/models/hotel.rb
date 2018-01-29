class Hotel < ApplicationRecord
  has_many :rooms,  dependent: :destroy
  validates :name, presence: { message: "it should have proper Hotel Name" }
  validates :rating,length: { in: 0..5 }
  validates :location, presence: { message: "it should have proper Location details" }
end
