class Album < ActiveRecord::Base
	belongs_to :artist
	has_many :tracks
	mount_uploader :cover_art, CoverArtUploader
	extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    acts_as_taggable
    acts_as_taggable_on :genres

   def should_generate_new_friendly_id?
    title_changed? || super
  end

  

end
