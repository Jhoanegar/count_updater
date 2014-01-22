require 'plist'
require 'adapter'
class ItunesXmlAdapter 
  include Adapter
  def read_songs(file)
    songs = []
    library = Plist::parse_xml(file)
    library["Tracks"].each do |k, track|
      songs.push(Song.new(key:k, uri:track["Location"],
                          play_count:track["Play Count"]))
    end
    songs
  end
end


