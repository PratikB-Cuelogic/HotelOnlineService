ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  menu label: "Admin"
  actions :all, :except => :new

  config.filters = false
  config.batch_actions = false


  index do
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "New" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
