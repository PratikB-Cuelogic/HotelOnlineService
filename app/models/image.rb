class Image < ApplicationRecord
  mount_uploader :image
  belongs_to :imageable, polymorphic: true 
end
