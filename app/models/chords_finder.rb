class ChordsFinder
    BASE_URL = 'https://www.cifraclub.com.br'

    def self.find_chords(params)
        url = "#{BASE_URL}/#{params[:artist].parameterize}/#{params[:music].parameterize}"

        doc = Nokogiri::HTML(URI.open(url))

        doc.search('pre')&.first&.content
    end
end