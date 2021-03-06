class ProfilesController < ApplicationController
	 before_action :authenticate_artist!

	def show
	  @artist = Artist.friendly.find params[:artist_id]
	  @profile = @artist.profile.find params[:artist_id]
	 end

     def create
      @profile = Profile.new(profile_params)

  	  if @profile.save 
        flash[:notice] = 'Profile created'
        redirect_to artists_profile_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
    end

 	def edit
      @profile = current_artist.build_profile()
    end 


     def update
       @artist = Artist.friendly.find params[:artist_id]
 	   @profile = @artist.profile
    
      if @profile.update_attributes profile_params
        flash[:notice] = 'Profile has been updated'
        redirect_to artist_profile_path
      else
        flash.now[:warning] = 'There were problems when trying to update this Profile'
        render :action => :edit
      end
    end



    # def set_gallery
    #   @profile = profile.friendly.find(params[:artist_id])
    # end



    private
      
    def profile_params
      params.require(:profile).permit(:id, :artist_id, :location, :cover_photo, :remove_cover_photo)
    end


end
