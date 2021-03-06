class AlbumsController < ApplicationController
	 before_action :authenticate_artist!

   layout 'manager'

	def index
    @q = Project.search(params[:q])
    @projects =  @q.result.includes(:albums)
    @project = Project.friendly.find params[:project_id]
    @albums = @project.albums.order("release_date DESC")
	end

	def show
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.includes(:albums).includes(:tracks).order("title").paginate(:page => params[:page], :per_page => 8)
    @project = Project.friendly.find params[:project_id]
	  @album = Album.find params[:id]
    @tracks = @album.tracks.order(:row_order)
    respond_to do |format|
    format.html 
    format.json { render json: @tracks}
    end
	end

  def new
    @q = Project.search(params[:q])
    @project = Project.find(params[:project_id])
    @album = @project.albums.new()
  end

  def create
    @artist = current_artist.friendly_id
    @project = Project.friendly.find params[:project_id]
    @album = Album.new(album_params)

  	  if @album.save 
        flash[:notice] = 'Album created'
        redirect_to @project
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
  end

 	def edit
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.includes(:albums).includes(:tracks).order("title").paginate(:page => params[:page], :per_page => 8)
    @project = Project.friendly.find params[:project_id]
    @album = Album.find params[:id]
    @tracks = @album.tracks
	end


    def update
   @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.includes(:albums).includes(:tracks).order("title").paginate(:page => params[:page], :per_page => 8)
    @project = Project.friendly.find params[:project_id]
    @album = Album.find params[:id]
    @tracks = @album.tracks
    
      if @album.update_attributes album_params
        flash[:notice] = 'Album has been updated'
        redirect_to @project
      else
        flash.now[:warning] = 'There were problems when trying to update this Profile'
        render :action => :edit
      end
    end

    def destroy
     @project = Project.friendly.find params[:project_id]
  	  @album = Album.friendly.find params[:id]
      @album.destroy
      flash[:notice] = 'Album Obliterated'
      redirect_to @project
    end

    def tag_cloud
    @tags = Album.tag_counts_on(:genres)
    end

    # def set_gallery
    #   @album = profile.friendly.find(params[:artist_id])
    # end



    private


    # def artist_is_current_artist
    #   unless current_artist.friendly_id == params[:artist_id]
    #    flash[:notice] = "You may only edit your own content."
    #    redirect_to artist_albums_path
    #   end
    # end
      
    def album_params
      params.require(:album).permit(:id, :project_id, :title, :release_date, :cover_art, :remove_cover_art, :genre, :genre_list, :tag_list, :name, :song, :remove_song)
    end


end
