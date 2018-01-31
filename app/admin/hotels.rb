ActiveAdmin.register Hotel do
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

  controller do
    def new
      @hotel = Hotel.new
    end
    
  def show
    @hotel=Hotel.find(params[:id])
  end

    def create
      @hotel = Hotel.create(post1_params)
      if @hotel.update_attributes(post2_params)
        redirect_to [:admin, @hotel]
      else
        render 'new'
      end
    end
    
    def update
      @hotel = Hotel.find(params[:id])           
      if @hotel.update_attributes(post2_params)
        redirect_to [:admin, @hotel]
      else
        render 'edit'
      end
    end

    private

    def post1_params
      puts "1111"
      params.require(:hotel).permit(:name, :rating, :location, :description)
    end

    def post2_params
      puts "222"
      params.require(:hotel).permit(:name, :rating, :location, :description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
  end

  #permit_params :name, :rating, :location, :description,images_attributes: [:image]

  filter :name
  filter :location
  filter :rating
  filter :created_at
  filter :updated_at

  form  html: { multipart: true } do |f|
    f.inputs "New" do
      f.input :name
      f.input :location
      f.input :description
      f.input :rating, as: :number, min: 0,max: 5      
    end
      f.has_many :images do |i|
        i.inputs do          
          i.input :image,as: :file,:hint => i.object.image.present? \
          ? image_tag(i.object.image.url)
          : content_tag(:span, "not added yet"), class: 'image_size'
        end
      end
    f.actions
  end
end

