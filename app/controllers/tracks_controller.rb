class TracksController < ApplicationController
layout 'manager'

 before_action :authenticate_artist!, :except => [:download]

 def update_row_order
    @track = Track.find(track_params[:track_id])
    @track.row_order_position = track_params[:row_order_position]
    @track.save

    render nothing: true 
  end
 
  def index
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @artist = current_artist.friendly_id
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page], :per_page => 8)
    @project = Project.friendly.find(params[:project_id])
    @album = @project.albums.friendly.find params[:album_id]
    @tracks = @album.tracks.friendly.rank(:row_order).all
    @track = @album.tracks.new

    respond_to do |format|
        format.html 
        format.json { render json: @tracks}
      end
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
    @track = @album.tracks.new({ :file_name => params[:file], :title => params[:file].original_filename.split(".")[0].titleize, :duration => "", :info_artist => params[:project_id].titleize, :info_album => params[:album_id].titleize, :info_year => @album.release_date.strftime("%Y").to_i, :info_cover => @album.cover_art.url, :row_order_position => "" })
    if @track.save!
      respond_to do |format|
        format.json{ render :json => @track }
      end
      TagLib::MPEG::File.open(@track.file_name.mp3.path) do |file|
     tag = file.id3v2_tag(true)
     prop = file.audio_properties
     song_duration = prop.length
     file.save 
      @track.update_attributes({:duration => song_duration})
     end
    end
  end

  def update
    @track = Track.find params[:id]
      if @track.update_attributes track_params
        flash[:notice] = 'Track has been updated'
        redirect_to :back
      else
        flash.now[:warning] = 'There were problems when trying to update this track'
        render :action => :edit
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
    path = "/#{@track.file_name.file}"
    send_file @track.file_name.mp3.path, x_sendfile: true, :stream => true
  end


  private     



    def track_params
      params.require(:track).permit(:project_id, :album_id, :title, :file_name, :remove_file_name, :delete_media, :row_order_position, :duration, :slug, :info_artist,:info_album, :info_year, :info_cover, :track_id)
    end
end
