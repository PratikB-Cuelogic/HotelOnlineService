ActiveAdmin.register Hotel do
  
  controller do
    def new
      @hotel = Hotel.new
    end
    
    def show
      @hotel=Hotel.find(params[:id])
    end

    def create
      @hotel = Hotel.create(hotel_params)
      hotel_redirect @hotel
    end
    
    def update
      @hotel = show
      hotel_redirect @hotel
    end

    def hotel_redirect hotel
      if hotel.update_attributes(hotel_images_params)
        redirect_to [:admin, @hotel]
      else
        render 'edit'
      end
    end

    private

    def hotel_params
      params.require(:hotel).permit(:name, :rating, :state, :city, :location, :description)
    end

    def hotel_images_params
      params.require(:hotel).permit(:name, :rating, :state, :city, :location, :description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
  end

  filter :name
  filter :location
  filter :rating
  filter :created_at
  filter :updated_at
    
  form  html: { multipart: true } do |f|
    f.inputs "New" do
      f.input :name
      f.input :state, as: :select, collection: []
      f.input :city, as: :select, collection: []
      f.input :location
      f.input :description
      f.input :rating, as: :number, min: 0,max: 5      
    end
      f.has_many :images do |i|
        i.inputs do          
          i.input :image,as: :file,:hint => i.object.image.present? ? image_tag(i.object.image.url) : content_tag(:span, "not added yet"), class: 'image_size' , :actions => :edit
        end
      end
    f.actions
  end
end

