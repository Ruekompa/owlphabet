class TracksController < ApplicationController

	def new
	  @artist = Artist.friendly.find params[:artist_id]
	  @album = Album.friendly.find params[:album_id]
	  @track = Track.new
	end

	def create
      @artist = Artist.friendly.find params[:artist_id]
      @album = Album.friendly.find params[:album_id]
      @track = Track.new(track_params)

  	  if @track.save 
        flash[:notice] = 'Album created'
        redirect_to artist_album_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
    end

	 private
      
    def track_params
      params.require(:track).permit(:id, :artist_id, :album_id, :name, :track_media)
    end
end
