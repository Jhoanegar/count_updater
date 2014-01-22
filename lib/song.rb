class Song
  attr_reader :key, :basename, :play_count

  def initialize(attributes = {} )
    @key = attributes[:key]
    @basename = filename_with_extension(attributes[:uri]) 
    @play_count = attributes[:play_count]
  end

  def ==(other_song)
    @basename == other_song.basename
  end
  
  private 
  def filename_with_extension(uri)
    File.basename(uri).chomp
  end
end

class NilSong
  def play_count
    0
  end
end
