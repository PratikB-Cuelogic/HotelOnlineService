class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :mobile_no, :password])
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private
    def storable_location?
      puts "1111"
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      puts "2222"      
      store_location_for(:member, request.fullpath)
    end

   def after_sign_in_path_for(resource_or_scope)
      puts resource_or_scope.inspect
    if member_signed_in?
      puts "3333"    
      session[:member] = current_member.id
      puts session[:member]
      stored_location_for(resource_or_scope) || super     
    else
      puts current_admin_user
      stored_location_for(resource_or_scope)
    end
   end

   def after_sign_out_path_for(resource_or_scope)     
      if resource_or_scope == :member
        puts "add"
        request.referrer || super
      else
        puts "del"
        '/home/index'
      end
   end

end
