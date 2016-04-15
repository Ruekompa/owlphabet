class ProjectsController < ApplicationController
   before_action :authenticate_artist!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page], :per_page => 8)
  end

	def show
    @q = Project.search(params[:q])
    @projects =  @q.result.includes(:albums)
    @project = Project.includes(:albums).find params[:id]
    @albums = @project.albums.all
	end


  def new
    @q = Project.search(params[:q])
    @projects =  @q.result.includes(:albums)
    @project = Project.new 
  end


  def create
    @project = Project.new(project_params)

  	  if @project.save 
        flash[:notice] = 'Album created'
        redirect_to projects_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new Artist'
        render :action => :new
      end
    end

 	def edit
    @q = Project.search(params[:q])
    @projects =  @q.result.includes(:albums)
	  @project = Project.friendly.find params[:id]
	end


  def update
    @project = Project.friendly.find params[:id]
      if @project.update_attributes project_params
        flash[:notice] = 'Profile has been updated'
        redirect_to projects_path
      else
        flash.now[:warning] = 'There were problems when trying to update this Profile'
        render :action => :edit
      end
  end

  def destroy
    @project = Project.friendly.find params[:id]
      @project.destroy
      flash[:notice] = 'Project Obliterated'
      redirect_to :index
    end

   def search
    index
    render :index
   end


    def set_project
      @project = project.friendly.find(params[:project_id])
    end



    private

    # def artist_is_current_artist
    #   unless current_artist.friendly_id == params[:artist_id]
    #    flash[:notice] = "You may only edit your own content."
    #    redirect_to artist_albums_path
    #   end
    # end
      
    def project_params
      params.require(:project).permit(:title, :cover_photo, :remove_cover_photo, :slug)
    end


end
