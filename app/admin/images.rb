ActiveAdmin.register Image do

  actions :all, :except => :new
  permit_params :image,:imageable_type,:imageable_id,images_attributes: [:image]

  controller do
    before_action :find_attachable
  
    def create
      @images.images.create attachment_params
      redirect_to @images
    end
  
    private
  
    def attachment_params
      params.require(:images).permit(:image)
    end
  
    def find_attachable
      params.each do |name, value|
        return @images = $1.classify.constantize.find(value) if name =~ /(.+)_id$/
      end
    end
  end

  index do
    selectable_column
    id_column
    column :image do |image_value|
      image_tag image_value.image.url(:thumb), class: 'image_size'
    end
    column :imageable_type
    column "Imageable" do |i|
      if i.imageable_type == "Room"
       rname=i.imageable_type+"#"+i.imageable_id.to_s
       link_to rname, admin_room_path(i.imageable_id)    
     elsif i.imageable_type == "Hotel"
       hotel_obejct = Hotel.find(i.imageable_id)
       link_to hotel_obejct.name, admin_hotel_path(i.imageable_id)    
      end    
    end
    column "Created Date",:created_at
    column "Updated Date",:updated_at
    actions
  end

end
