ActiveAdmin.register Room do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  batch_action :inactive do |ids|
    batch_action_collection.find(ids).each do |post|
      
    end
    redirect_to admin_path, alert: "The posts have been flagged."
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
      @room = Room.create(post1_params)
      if @room.update_attributes(post2_params)
        redirect_to [:admin, @room]
      else
        render 'new'
      end
    end
    
    def update
      @room = Room.find(params[:id])           
      if @room.update_attributes(post2_params)
        redirect_to [:admin, @room]
      else
        render 'edit'
      end
    end

    private

    def post1_params
      puts "1111"
      params.require(:room).permit(:price, :no_of_bedroom, :description, :inactive, :hotel_id)
    end

    def post2_params
      puts "222"
      params.require(:room).permit(:price, :no_of_bedroom, :description, :inactive, :hotel_id,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
  end

  filter :hotel_id, as: :select, multiple: false, collection: Hotel.all
  filter :price
  filter :no_of_bedroom
  filter :inactive
  filter :created_at
  filter :updated_at

 permit_params :price, :no_of_bedroom, :description, :inactive, :hotel_id
 form do |f|
    f.inputs do
    if f.object.new_record?
      f.input :hotel_id, as: :select, multiple: false, collection: Hotel.all
	end
      f.input :price
      f.input :no_of_bedroom, as: :select, multiple: false, collection: ['1','2','3']
      f.input :description
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
