class Track < ActiveRecord::Base
	belongs_to :artist
	belongs_to :album
	mount_uploader :track_media, TrackMediaUploader
end
