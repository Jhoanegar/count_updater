require 'spec_helper'
require 'song'

describe Song do

  let(:test_song) { { uri: "F:/filename.mp3", play_count: 15} }

  describe "#new" do
    it 'creates the song' do
      expect(Song.new test_song).not_to be nil 
    end
  end


  context "when comparing to another song" do 
    let(:song) { Song.new test_song }

    context "with identical filename" do
      let(:other_song) { Song.new test_song }
      
      it "matches" do
        expect(song).to eq(other_song) 
      end

    end

    context "with similar filename" do
      let(:other_song) {  Song.new(
                            uri: "file://localhost/F:/directory/filename.mp3",
                            play_count: 15
                          )
                       }

      it "matches" do
        expect(song).to eq(other_song) 
      end
    end

    context "with different filename" do
      let(:song_filenames) { %w{ preffixfilename.mp3 filenamesuffix.mp3 
                                 preffixfilename.mp3suffix filename.mp3/f/f.mp3
                               }
                           }
      it "doesn't match" do
        song_filenames.each do | filename |
          expect { Song.new uri: "F:/#{filename}", play_count: 15 }.not_to eq(song)
        end
      end

    end

  end
end
