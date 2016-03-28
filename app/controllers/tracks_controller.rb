class TracksController < ApplicationController

  def index
    @track = Track.all
  end

  def show
    @project = Project.friendly.find params[:project_id]
    @artist = Artist.friendly.find params[:artist_id]
    @album = Album.friendly.find params[:album_id]
    @track = Track.find params[:id]
  end

	def new
    @project = Project.friendly.find params[:project_id]
    @artist = Artist.friendly.find params[:artist_id]
    @album = Album.friendly.find params[:album_id]
	  @track = Track.new
	end

	def create
      @project = Project.friendly.find params[:project_id]
      @artist = Artist.friendly.find params[:artist_id]
      @album = Album.friendly.find params[:album_id]
      @track = Track.new(track_params)

  	  if @track.save 
        flash[:notice] = 'Album created'
        redirect_to :artist_project_album_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
    end

	 private
      
    def track_params
      params.require(:track).permit(:id, :artist_id, :album_id, :name, {songs: []})
    end
end
