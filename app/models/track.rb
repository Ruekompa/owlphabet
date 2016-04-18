class Track < ActiveRecord::Base
	has_many :credits
	has_many :artists, :through => :credits
	belongs_to :project
	belongs_to :album
	
	mount_uploader :file_name, SongUploader

extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    acts_as_taggable
    acts_as_taggable_on :genres

   def should_generate_new_friendly_id?
    title_changed? || super
  end
end
