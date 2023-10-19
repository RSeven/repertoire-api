class Setlist < ApplicationRecord
    validates :name, presence: true

    has_many :music_setlists
    has_many :musics, through: :music_setlists

    accepts_nested_attributes_for :music_setlists, allow_destroy: true

    def to_text
        musics.map.with_index { |m, idx| "#{idx + 1}. #{m.name}" }.join("\n")
    end

    def export_to_trello
        list = Trello::List.create(
            board_id: '62e71ba5d7d41a36cc4afa27',
            pos: 'bottom',
            name: name
        )

        musics.each_with_index do |m, idx|
            Trello::Card.create(
                name: m.name,
                desc: m.chords || m.lyrics,
                list_id: list.id,
                board_id: '62e71ba5d7d41a36cc4afa27'
            )
        end
    end
end
