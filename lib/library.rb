require 'nokogiri'
require 'song'

class Library
  def initialize(path)
    @songs = []
    read_songs(path)
  end
  
  private 

  def read_songs(file)
  end

end
