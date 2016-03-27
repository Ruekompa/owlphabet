class AddProjectToArtists < ActiveRecord::Migration
  def change
    add_reference :artists, :project, index: true, foreign_key: true
  end
end
