class Track < ActiveRecord::Base
	belongs_to :artist, :through => :album
	mount_uploader :track_media, TrackMediaUploader
end
