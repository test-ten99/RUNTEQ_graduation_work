class CreateLiveRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :live_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :live_title
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
