class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :email, :mobile_no, :password])
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:member, request.fullpath)
    end

   def after_sign_in_path_for(resource_or_scope)
     if member_signed_in?
       CustomLogger.login_log current_member
       session[:member] = current_member.id
       stored_location_for(resource_or_scope) || super     
     else
       stored_location_for(resource_or_scope)
     end
   end

   def after_sign_out_path_for(resource_or_scope)     
     if resource_or_scope == :member
       request.referrer || super
     else
       '/home/index'
     end
   end

end
