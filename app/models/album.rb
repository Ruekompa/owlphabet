class Album < ActiveRecord::Base
  belongs_to :project
  has_many :tracks
  has_many :credits
	has_many :artists, :through => :credits

  accepts_nested_attributes_for :tracks

	mount_uploader :cover_art, CoverArtUploader
  mount_uploader :song, SongUploader

	extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]
    acts_as_taggable
    acts_as_taggable_on :genres

   def should_generate_new_friendly_id?
    title_changed? || super
  end

  
end
