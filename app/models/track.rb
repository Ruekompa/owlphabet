class Track < ActiveRecord::Base

	include RankedModel
	ranks :row_order

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


  def calculated_row_order_position
  self.siblings.where('row_order < ?', self.row_order).count + 1
 end


end
