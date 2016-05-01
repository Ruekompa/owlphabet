class MediaContentsController < ApplicationController
	before_action :authenticate_artist!

	 def create
     @media = Media.new(file_name: params[:file])
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end
end
