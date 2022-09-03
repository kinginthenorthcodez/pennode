class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

   protected
   def after_sign_in_path_for(_resource)
     flash[:notice] = 'notice: Please Welcome !}'
     root_path
   end
   def after_sign_out_path_for(_resource)
     cookies[:lastUsersession] = current_user
     flash[:notice] = 'notice:  Where you going!!'
     new_user_session_path
   end
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
     devise_parameter_sanitizer.permit(:sign_up,
                                       keys: %i[name photo bio posts_counter email password password_confirmation])
     devise_parameter_sanitizer.permit(:account_update,
                                       keys: %i[name photo bio posts_counter email password password_confirmation
                                                current_password])
   end
end
