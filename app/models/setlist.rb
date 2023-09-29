class Setlist < ApplicationRecord
    validates :name, presence: true

    has_many :music_setlists
    has_many :musics, through: :music_setlists
end
