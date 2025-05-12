class CreateSongs < ActiveRecord::Migration[7.2]
  def change
    create_table :songs do |t|
      t.integer :track_number
      t.string :title
      t.string :spotify_track_id

      t.timestamps
    end
  end
end
