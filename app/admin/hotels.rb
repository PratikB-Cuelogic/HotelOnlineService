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
  def permitted_params
     params.permit!
   end
end

  permit_params :name, :rating, :location, :description,image_attributes: [:image]

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
      f.has_many :images do |image|
        image.inputs do          
          image.input :image,as: :file
        end
      end
    f.actions
  end
end
