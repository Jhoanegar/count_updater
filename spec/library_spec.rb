require 'spec_helper'
require 'library'

describe Library do
  let(:example_library) { '/home/jhoan/count_updater/spec/lib.xml' }
  before(:each) { @lib = Library.new(example_library) } 

  subject { @lib }

  describe "#new" do

    context "with a valid file" do
      it { should_not be_nil } 
    end
    
  end
 
    

end
