class AddRowOrderToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :row_order, :integer
  end
end
