require 'fakefs/spec_helpers'

TEST_LIB = File.join(File.expand_path(File.dirname(__FILE__)),
                    "assets", 
                    "lib.xml")


TEST_DB = File.join(File.expand_path(File.dirname(__FILE__)),
                   "assets",
                   "banshee.db")


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include FakeFS::SpecHelpers, fakefs:true

  config.before(:each) do
    if example.metadata[:db]
      `cp #{TEST_DB} #{TEST_DB}.bak`
    end
  end

  config.after(:each) do
    if example.metadata[:db]
      `cp #{TEST_DB}.bak #{TEST_DB}`
      `rm #{TEST_DB}.bak`
    end
  end

end
