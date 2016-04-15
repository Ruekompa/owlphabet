class MusicController < ApplicationController
	layout 'listener_account'

	def index
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page], :per_page => 8)
 
	end

	def show_project
     @q = Project.search(params[:q])
     @projects =  @q.result.includes(:albums)
     @project = Project.includes(:albums).find params[:id]
     @albums = @project.albums.all
	end

	def albums
	 @q = Project.search(params[:q])
     @projects =  @q.result.includes(:albums)
     @project = Project.includes(:albums).find params[:id]
     @albums = @project.albums.all	
	end

	def show_album
     @q = Project.search(params[:q].try(:merge, m: 'or'))
     @projects =  @q.result.includes(:albums).includes(:tracks).order("title").paginate(:page => params[:page], :per_page => 8)
     @project = Project.friendly.find params[:project_id]
 	 @album = Album.find params[:album_id]
     @tracks = @album.tracks
    end

    def search
     @q = Project.search(params[:q])
     @projects = @q.result(:distinct => true).paginate(:per_page => 5, :page => params[:page])
    render 'index'
    end


end
