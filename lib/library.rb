require 'plist'

class Library
  def initialize(file, adapter)
    @songs = adapter.read_songs(file)
  end
end
