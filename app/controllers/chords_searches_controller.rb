class ChordsSearchesController < ApplicationController
    def search
        content = ChordsFinder.find_chords(search_params)

        head(:not_found) if content.blank?

        render json: { content: content }, status: :ok
    end

    private

    def search_params
        params.require(:chords_search).permit(:artist, :music)
    end
end