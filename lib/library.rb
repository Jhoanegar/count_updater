require 'nokogiri'
require 'song'

class Library
  def initialize(path)
    @songs = []
    read_songs(path)
  end
  
  private 

  def read_songs(file)
    content = Nokogiri::XML::Reader(File.read(file)) 
    content.xpath('//dict//dict//dict//Location')
  end
end
