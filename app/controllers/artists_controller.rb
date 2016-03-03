class ArtistsController < ApplicationController
def show
	 if Artist.find params[:id] == "sign_out"
      session.destroy
      flash[:notice] = 'Signed Out'
      redirect_to root_path
    else
      @artist = Artist.friendly.find params[:friendly_id]
    end

end
end