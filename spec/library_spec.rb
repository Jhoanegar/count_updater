require 'spec_helper'
require 'library'

describe Library do
  let(:example_library) { '/home/jhoan/count_updater/spec/lib.xml' }
  
  describe "#new" do
    it "creates the object" do 
      expect(Library.new(example_library)).to_not be nil 
    end
  end
 
  context "with a valid file" do
    before(:each) { (Library.new(example_library)).to_not be nil }
    
  end

end
