class Music < ApplicationRecord
    validates :name, presence: true

    has_many :music_setlists, dependent: :destroy
    has_many :setlists, through: :music_setlists

    after_create :fill_spotify_metadata

    def fill_spotify_metadata
        spotify_track = RSpotify::Track.search(name).first
        
        update(
            duration_s: spotify_track.duration_ms / 1000,
            popularity: spotify_track.popularity,
            spotify_url: spotify_track.external_urls['spotify'],
            isrc: spotify_track.external_ids['isrc']
        )
    end
end
