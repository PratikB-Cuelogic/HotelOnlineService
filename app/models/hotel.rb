class Hotel < ApplicationRecord
  has_many :rooms,  dependent: :destroy
  has_many :images, as: :imageable
  name_regex=/\A[a-zA-Z][a-zA-Z ?]+\z/;
  validates :name, presence: { message: "it should have proper hotel name" }, allow_blank: false, format: {with: name_regex, message: 'Name does not contain special characters'}
  validates :rating,presence: true, allow_blank: true,length: { in: 0..5, message: "it should have have value between 0 to 5" }
  validates :location, presence: { message: "it should have proper Location details" }
  accepts_nested_attributes_for :images, allow_destroy: true
  attr_accessor :images_attributes
  mount_uploader :image
end
