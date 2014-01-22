require 'spec_helper'
require 'banshee_db_adapter'
describe BansheeDBAdapter do
  before(:each) do
    @adapter = BansheeDBAdapter.new
    @songs = @adapter.read_songs(TEST_DB)
  end

  context 'with a valid database' do

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

  context 'when updating the database' do
    it 'resets the play_count of all the songs', :db do
      keys = [] 
      @songs.each { |song| keys.push(song.key) }
      @adapter.write_songs(@songs)
      @adapter = BansheeDBAdapter.new
      @songs = @adapter.read_songs(TEST_DB)

      expect(@songs).to be_empty
    end
  end

end
