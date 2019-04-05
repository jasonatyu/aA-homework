module TracksHelper
    include ERB::Util
    def ugly_lyrics(lyrics)
        html = '<pre>'
        lyrics_arr = h(lyrics).split("\r\n")
        lyrics_arr.each do |line|
            html += "♫ " + line + "\r\n"
        end
        html += '</pre>'
        html.html_safe
    end
end
