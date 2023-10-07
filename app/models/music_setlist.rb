class MusicSetlist < ApplicationRecord
  belongs_to :music
  belongs_to :setlist

  default_scope { order('"music_setlists"."position" ASC') }
end
