require 'spec_helper'
require 'adapter'

describe Adapter do
  before(:each) do
    @songs = []
    1.upto(4) do |i|
      @songs << Song.new(uri:"song#{i}.mp3",
                         play_count:i*2,
                         key:i)
    end
  end

  describe "#find_by_basename" do
    context "when the songs exists" do
      it 'returns the song' do
        song = Adapter::find_by_basename(@songs,"song3.mp3")
        expect(song.play_count).to eq 6
        expect(song.basename).to eq "song3.mp3"
        expect(song.key).to eq 3
      end
    end

    context "when the song doesn't exist" do
      it 'returns a NilSong' do
        song = Adapter::find_by_basename(@songs,"non_existing.file")
        expect(song).to be_a NilSong
      end
    end
    
  end
      
end

