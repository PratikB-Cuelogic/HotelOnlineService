class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :mobile_no, :password])
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

=begin  def after_sign_out_path_for(resource_or_scope)
  	puts "111111111111111111"
  	puts resource_or_scope
    if resource_or_scope == :user
      root_path
    elsif resource_or_scope == :admin_users
      'home/index'
    else
      root_path
    end
  end
=end

end
