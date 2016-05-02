class Artists::SessionsController < Devise::SessionsController
layout 'invite_pages'
 # before_action :configure_permitted_parameters, if: :devise_controller?

 

def after_sign_in_path_for(resource)
  stored_location_for(resource) ||
    if resource.is_a?(Artist)
      admin_path
    else
      super
    end
end

def after_sign_out_path_for(resource_or_scope)
    new_artist_session_path
end



   private

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end



  # You can put the params you want to permit in the empty array.
  def account_update_params
    params.require(:artist).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
