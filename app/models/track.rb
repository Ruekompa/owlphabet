class Track < ActiveRecord::Base
	has_many :credits
	has_many :artists, :through => :credits
	belongs_to :project
	belongs_to :album
	
	mount_uploader :file_name, SongUploader
end
