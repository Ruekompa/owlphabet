class ArtistsController < ApplicationController

def index
	@artists = Artist.all
	@artist = Artist.friendly.find params[:id]
end

def show
	@artist = Artist.friendly.find params[:id]

end


end