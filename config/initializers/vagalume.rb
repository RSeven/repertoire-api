module Vagalume
    NEW_BASE_URL = "http://api.vagalume.com.br/search.php?apikey=#{Rails.application.credentials.vagalume.api_key}&"

    def find(artist, song)
        request_url = NEW_BASE_URL + "art=#{CGI.escape(artist)}&mus=#{CGI.escape(song)}"
        result = MultiJson.decode(URI.open(request_url).read)
        search_result = Vagalume::SearchResult.new(result)
    end
end