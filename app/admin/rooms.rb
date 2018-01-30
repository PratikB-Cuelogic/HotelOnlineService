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
    f.actions
  end
end
