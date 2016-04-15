class TracksController < ApplicationController
 before_action :authenticate_artist!
 
  def index
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @artist = current_artist.friendly_id
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page], :per_page => 8)
    @project = Project.friendly.find(params[:project_id])
    @album = @project.albums.friendly.find params[:album_id]
    @tracks = @album.tracks.all
    @track = @album.tracks.new

  end

  def show
    @artist = current_artist.friendly_id
    @project = Project.friendly.find params[:project_id]
    @album = @project.albums.friendly.find params[:album_id]
    @track = Track.find params[:id]
  end

	def new
    @artist = current_artist.friendly_id
    @project = Project.friendly.find params[:project_id]
    @album = Album.friendly.find params[:album_id]
	  @track = @albums.tracks.new
	end

  def create
    @artist = current_artist.friendly_id
    @project = Project.friendly.find params[:project_id]
    @album = @project.albums.friendly.find params[:album_id]
    @track = @album.tracks.new({ :file_name => params[:file], :name => params[:file].original_filename.split(".")[0].titleize })
    if @track.save!
      respond_to do |format|
        format.json{ render :json => @track }
      end
    end
  end

  def delete_media
    @artist = current_artist.friendly_id
    @project = Project.friendly.find params[:project_id]
    @album = @project.albums.friendly.find params[:album_id]
    Track.where(id: params[:tracks]).destroy_all
      flash[:notice] = 'Song Track Trashed'
      redirect_to :back
  end
  
def download
  @track = Track.find params[:id]
  path = "/#{track.file_name}"
  send_file @track.mv_link.path, x_sendfile: true
end


	 private
      
    def track_params
      params.require(:track).permit(:project_id, :album_id, :name, :file_name, :remove_file_name, :delete_media, :row_order_position)
    end
end
