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
  permit_params :name, :rating, :location, :description

  filter :name
  filter :location
  filter :rating
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "New" do
      f.input :name
      f.input :location
      f.input :description
      f.input :rating, as: :number, min: 0,max: 5
    end
    f.actions
  end
end
