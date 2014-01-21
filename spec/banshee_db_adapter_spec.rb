require 'spec_helper'
require 'banshee_db_adapter'

describe BansheeDBAdapter do
  context 'with a valid database' do
    before(:each) do
      adapter = BansheeDBAdapter.new
      @songs = adapter.read_songs(TEST_DB)
    end

    it 'parses the correct number of songs' do
      expect(@songs).to have(2).things
    end
    
    context "when creating the song objects" do 
      it 'reads the key' do
        expect(@songs[0].key).to eq("1")
      end

      it 'reads the basename' do
        expect(@songs[0].basename).to eq "dance.mp3"
      end
      
      it 'reads the play count' do
        expect(@songs[0].play_count).to eq(2)
      end
  
    end

  end

end
