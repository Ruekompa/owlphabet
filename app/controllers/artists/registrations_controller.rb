class Artists::RegistrationsController < Devise::RegistrationsController
layout 'invite_pages', except: [:edit]
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
  super
  end

  # POST /resource
  # def create
   
  # end

  # GET /resource/edit
  def edit
  @q = Project.search(params[:q])
  @projects =  @q.result.includes(:albums)
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def after_sign_in_path_for(resource)
  stored_location_for(resource) ||
    if resource.is_a?(Artist)
      admin_path
    else
      super
    end
  end

   

# def full_name
#   [first_name, last_name].join(' ')
# end

# def full_name=(name)
#   elements = name.split(' ')
#   self.last_name = elements.delete(elements.last)
#   self.first_name = elements.join(" ")
# end


  private

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    params.require(:artist).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  # You can put the params you want to permit in the empty array.
  def account_update_params
    params.require(:artist).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
