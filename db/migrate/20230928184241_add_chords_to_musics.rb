class AddChordsToMusics < ActiveRecord::Migration[7.0]
  def change
    add_column :musics, :chords, :string
  end
end
