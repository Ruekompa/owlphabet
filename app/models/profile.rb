class Profile < ActiveRecord::Base
	belongs_to :artist
	mount_uploader :cover_photo, CoverPhotoUploader
end
