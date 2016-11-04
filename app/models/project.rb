class Project < ActiveRecord::Base
	belongs_to :artist
	has_many :albums, dependent: :destroy
	has_many :tracks, :through => :albums

	mount_uploader :cover_photo, CoverPhotoUploader
	
	extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

   def should_generate_new_friendly_id?
    title_changed? || super
   end

end
