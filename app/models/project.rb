class Project < ActiveRecord::Base
	has_many :albums
	has_many :artists, :through => :albums
	has_many :tracks, :through => :albums

	mount_uploader :cover_photo, CoverPhotoUploader
	extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

   def should_generate_new_friendly_id?
    title_changed? || super
   end


end
