class Image < ApplicationRecord
  before_validation :assign_imageable
  mount_uploader :image
  belongs_to :imageable, polymorphic: true 

end
