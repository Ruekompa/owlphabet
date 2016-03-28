class Track < ActiveRecord::Base
	belongs_to :artist
	belongs_to :album, polymorphic: true
	belongs_to :project, polymorphic: true

	mount_uploaders :songs, SongUploader
end
