class TracksController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @tracks = Track.all
    @track = Track.new
  end

  def show
    @project = Project.friendly.find params[:project_id]
    @artist = Artist.friendly.find params[:artist_id]
    @album = Album.friendly.find params[:album_id]
    @track = Track.find params[:id]
  end

	def new
    @project = Project.friendly.find params[:project_id]
    @artist = current_artist.friendly_id
    @album = Album.friendly.find params[:album_id]
	  @track = Track.new
	end

  def create
    @project = Project.friendly.find params[:project_id]
    @artist = current_artist.friendly_id
    @album = Album.friendly.find params[:album_id]
    @track = Track.new(name: params[:file].original_filename)

    if @track.save!
      respond_to do |format|
        format.json{ render :json => @track }
      end
    end
  end

def delete_track
  Track.where(id: params[:file]).destroy_all
  redirect_to root_url
end


	 private
      
    def track_params
      params.require(:track).permit(:id, :artist_id, :album_id, :name, :song, :remove_song)
    end
end
