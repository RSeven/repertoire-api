class CreateMusicSetlists < ActiveRecord::Migration[7.0]
  def change
    create_table :music_setlists do |t|
      t.references :music, null: false, foreign_key: true
      t.references :setlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
