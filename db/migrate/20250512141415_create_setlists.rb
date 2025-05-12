class CreateSetlists < ActiveRecord::Migration[7.2]
  def change
    create_table :setlists do |t|
      t.references :live_record, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
