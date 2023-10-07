class Setlist < ApplicationRecord
    validates :name, presence: true

    has_many :music_setlists
    has_many :musics, through: :music_setlists

    accepts_nested_attributes_for :music_setlists, allow_destroy: true
end
