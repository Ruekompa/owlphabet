class Artists::SessionsController < Devise::SessionsController
 before_action :configure_permitted_parameters, if: :devise_controller?

   private

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  def account_update_params
    params.require(:artist).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
