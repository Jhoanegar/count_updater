require 'song'
module Adapter
  def self.find_by_basename(songs,basename)
     songs.find { |song| song.basename == basename } || NilSong.new
  end
end
