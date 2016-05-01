class CreditsController < ApplicationController
	 # before_action :artist_is_current_artist, except: [:index, :show]
	 before_action :authenticate_artist!, only: [:new, :edit, :create, :update, :destroy]

	def index
    @artist = Artist.friendly.find params[:artist_id]
    @project = Project.friendly.find params[:project_id]
	@albums = Album.friendly.find params[:album_id]
	end

	def show
	  @artist = Artist.friendly.find params[:artist_id]
      @project = Project.friendly.find params[:project_id]
	  @album = Album.find params[:id]
	end

  def new
    @artist = Artist.friendly.find params[:artist_id]
    @project = Project.friendly.find params[:project_id]
	  @album = Album.new 
  end

  def create
    @artist = Artist.friendly.find params[:artist_id]
    @project = Project.friendly.find params[:project_id]
    @album = Album.new(album_params)

  	  if @album.save 
        flash[:notice] = 'Album created'
        redirect_to artist_project_albums_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
  end

 	def edit
 	  @artist = Artist.friendly.find params[:artist_id]
	  @album = Album.find params[:id]
	end


    def update
      @artist = Artist.friendly.find params[:artist_id]
      @album = Album.find params[:id]
    
      if @album.update_attributes album_params
        flash[:notice] = 'Profile has been updated'
        redirect_to artist_albums_path
      else
        flash.now[:warning] = 'There were problems when trying to update this Profile'
        render :action => :edit
      end
    end

    def destroy
      @artist = Artist.find(params[:artist_id])
  	  @album = Album.find params[:id]
      @album.destroy
      flash[:notice] = 'Album Obliterated'
      redirect_to :index
    end

    # def set_gallery
    #   @album = profile.friendly.find(params[:artist_id])
    # end



    private

     def set_album
       @album = Album.find(params[:id])
     end

    # def artist_is_current_artist
    #   unless current_artist.friendly_id == params[:artist_id]
    #    flash[:notice] = "You may only edit your own content."
    #    redirect_to artist_albums_path
    #   end
    # end
      
    def album_params
      params.require(:album).permit(:id, :artist_id, :project_id, :album_id, :title, :release_date, :cover_art, :remove_cover_art, :genre, :genre_list, :tag_list)
    end


end
