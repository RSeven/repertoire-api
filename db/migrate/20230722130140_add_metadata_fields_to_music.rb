class AddMetadataFieldsToMusic < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :isrc, :string
    add_column :musics, :spotify_url, :string
    add_column :musics, :duration_s, :integer
    add_column :musics, :popularity, :integer
  end
end
