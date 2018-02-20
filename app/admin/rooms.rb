ActiveAdmin.register Room do
  
  batch_action :inactive do |ids|
    batch_action_collection.find(ids).each do |post|
      r = Room.find_by_id(ids)
      r.inactive = Date.today
      r.save
    end
    redirect_to admin_rooms_path, alert: "Rooms have been Inactivated"
  end


  batch_action :active do |ids|
    batch_action_collection.find(ids).each do |post|
      r = Room.find_by_id(ids)
      r.inactive = nil
      r.save
    end
    redirect_to admin_rooms_path, alert: "Rooms have been Activated"
  end  

  scope :inactive
  scope :active
  controller do
    def new
      @room = Room.new
    end
    
    def show
      @room = Room.find(params[:id])
    end

    def create
      @room = Room.create(room_params)
      room_redirect @room
    end
    
    def update
      @room = show
      room_redirect @room
    end

    def room_redirect room
      if room.update_attributes(room_images_params)
        redirect_to [:admin, @room]
      else
        render 'new'
      end
    end

    private

    def room_params
      puts "1111"
      params.require(:room).permit(:price, :no_of_bedroom, :description, :inactive, :hotel_id)
    end

    def room_images_params
      puts "222"
      params.require(:room).permit(:price, :no_of_bedroom, :description, :inactive, :hotel_id,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
  end

  filter :hotel_id, as: :select, multiple: false, collection: Hotel.all
  filter :price
  filter :no_of_bedroom
  filter :created_at
  filter :updated_at

 permit_params :price, :no_of_bedroom, :description, :inactive, :hotel_id
 form do |f|
    f.inputs do
   # if f.object.new_record?
      f.input :hotel_id, as: :select, multiple: false, collection: Hotel.all, new_record: true
	#end
      f.input :price
      f.input :no_of_bedroom, as: :select, multiple: false, collection: ['1','2','3']
      f.input :description
      f.input :inactive
    end
      f.has_many :images do |i|
        i.inputs do          
          i.input :image,as: :file,:hint => i.object.image.present? ? image_tag(i.object.image.url) : content_tag(:span, "not added yet")
          i.input :image_cache, :as => :hidden 
        end
      end      
    f.actions
  end
end
