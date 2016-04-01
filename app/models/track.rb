class Track < ActiveRecord::Base
	has_many :credits
	has_many :artists, :through => :credits
	belongs_to :album
	
	mount_uploader :song, SongUploader
end
