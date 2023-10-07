class AddPositionToMusicSetlist < ActiveRecord::Migration[7.0]
  def change
    add_column :music_setlists, :position, :integer
  end
end
