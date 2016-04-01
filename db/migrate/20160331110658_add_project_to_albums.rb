class AddProjectToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :project, index: true, foreign_key: true
  end
end
