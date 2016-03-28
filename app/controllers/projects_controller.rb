class ProjectsController < ApplicationController

	def index
	 @projects = Project.all
	end

	def show
	 @project = Project.friendly.find params[:id]
	end


    def new
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
  	  @project = Project.find params[:id]
      @project.destroy
      flash[:notice] = 'Project Obliterated'
      redirect_to :index
    end

    def set_project
      @project = project.friendly.find(params[:artist_id])
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