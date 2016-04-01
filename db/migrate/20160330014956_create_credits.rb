class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.text :artist_ids, array: true, default: []

      t.timestamps null: false
    end
  end
end
