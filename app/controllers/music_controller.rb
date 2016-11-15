class MusicController < ApplicationController
	def index
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page])
    @genres = Album.tag_counts_on(:genres)
	end

	def show_project
     @q = Project.search(params[:q])
     @projects =  @q.result.includes(:albums)
     @project = Project.includes(:albums).find params[:id]
     @albums = @project.albums.order("release_date DESC")
	end

	def albums_index
     @q = Project.search(params[:q])
     @projects =  @q.result.includes(:albums)
     @albums = Album.includes(:project).order("release_date DESC").paginate(:page => params[:page])
     @genres = Album.tag_counts_on(:genres)	
	end

	def show_album
     @q = Project.search(params[:q].try(:merge, m: 'or'))
     @projects =  @q.result.includes(:albums).includes(:tracks).order("title").paginate(:page => params[:page])
     @project = Project.friendly.find params[:project_id]
 	 @album = Album.find params[:album_id]
     @tracks = @album.tracks.order(:row_order)
     @track = @album.tracks
    respond_to do |format|
    format.html 
    format.json { render json: @tracks}
    end
    end

    def search
     @q = Project.search(params[:q])
     @projects = @q.result(:distinct => true).paginate(:per_page => 5, :page => params[:page])
    render 'index'
    end

    def tag_cloud
    @genres = Album.tag_counts_on(:genres)
   end


end
