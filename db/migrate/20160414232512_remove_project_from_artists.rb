class RemoveProjectFromArtists < ActiveRecord::Migration
  def change
    remove_reference :artists, :project, index: true, foreign_key: true
  end
end
