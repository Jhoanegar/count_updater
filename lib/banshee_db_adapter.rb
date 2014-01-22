require 'sqlite3'
require 'song'
class BansheeDBAdapter
  SELECT_QUERY = <<-END
    SELECT TrackID, Uri, PlayCount 
    FROM CoreTracks
    WHERE PlayCount > 0
    END

  def read_songs(file)
    songs = []
    library = SQLite3::Database.new(file)
    library.execute(SELECT_QUERY).each do |row|
      songs.push(Song.new key:row[0].to_s, uri:row[1], play_count:row[2])
    end
    songs
  end
end
