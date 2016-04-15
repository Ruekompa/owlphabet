class MusicController < ApplicationController
	layout 'listener_account'

	def projects
	@q = Project.search(params[:q])
    @projects =  @q.result.includes(:albums)
   
	end
end
