class ManagersController < ApplicationController
	layout	'manager'

	before_action :authenticate_artist!

	def home
    @q = Project.search(params[:q].try(:merge, m: 'or'))
    @projects =  @q.result.order("title").includes(:albums).paginate(:page => params[:page], :per_page => 8)
	end

	def projects
		
	end

	def albums
		
	end


	def tracks

	end

	def artist_projects
		
	end

end
