require 'sqlite3'
require 'song'
class BansheeDBAdapter
  SELECT_QUERY = <<-END
    SELECT TrackID, Uri, PlayCount 
    FROM CoreTracks
    WHERE PlayCount > 0
    END

  UPDATE_QUERY = <<-END
    UPDATE CoreTracks 
    SET PlayCount=0 
    WHERE TrackID=?
  END


  def read_songs(file)
    songs = []
    @library ||= SQLite3::Database.new(file)
    @library.execute(SELECT_QUERY).each do |row|
      songs.push(Song.new key:row[0].to_s, uri:row[1], play_count:row[2])
    end
    return songs
  end

  def write_songs(songs)
    return unless @library
    songs.each do |song|
      @library.execute(UPDATE_QUERY,song.key)
    end
  end

  def find(songs, key)
    songs.find { |song| song.key == key } || NilSong
  end
end
