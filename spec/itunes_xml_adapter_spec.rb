require 'spec_helper'
require 'itunes_xml_adapter'

describe ItunesXmlAdapter do
  context 'with a valid library file' do
    before(:each) do 
      adapter = ItunesXmlAdapter.new 
      @songs = adapter.read_songs(TEST_LIB)
    end

    it 'parses the correct number of songs' do
      expect(@songs).to have(5).things
    end
    
    context "when creating the song objects" do 
      it 'reads the key' do
        expect(@songs[0].key).to eq("1114")
      end

      it 'reads the basename' do
        expect(@songs[0].basename).to eq "dance.mp3"
      end
      
      it 'reads the play count' do
        expect(@songs[0].play_count).to eq(46)
      end
  
    end
  end

end

