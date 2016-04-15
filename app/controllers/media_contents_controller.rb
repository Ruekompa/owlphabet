class MediaContentsController < ApplicationController
	before_action :authenticate_artist!, only: [:new, :edit, :create, :update, :destroy]

	 def create
     @media = Media.new(file_name: params[:file])
    if @media.save!
      respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end
end
