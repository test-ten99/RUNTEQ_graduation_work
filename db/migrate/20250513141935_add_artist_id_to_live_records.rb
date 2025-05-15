class AddArtistIdToLiveRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :live_records, :artist_id, :integer
    add_foreign_key :live_records, :artists
  end
end
