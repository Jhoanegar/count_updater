require 'spec_helper'
require 'backup_guy'
require 'fileutils'
require 'pry'
describe BackupGuy, fakefs:true  do

  before(:each) { @backup_guy = BackupGuy.new }

  HOME_DIR = File.expand_path("~/") << "/"
  DEFAULT_BACKUP_DIR = BackupGuy::DEFAULT_BACKUP_DIR
  CUSTOM_BACKUP_DIR = HOME_DIR + "custom_dir/"
  FILENAME = "file.db"
  TEST_FILE = HOME_DIR + "directory/#{FILENAME}"

  context 'when the files exist' do
    before(:each) do
      FileUtils.mkpath(HOME_DIR + "directory")
      FileUtils.touch(TEST_FILE)
    end

    context 'when no options are given' do
      after(:each)  { `rm #{DEFAULT_BACKUP_DIR} -Rf ` }

      it 'creates the backup in the default directory' do
        @backup_guy.backup(TEST_FILE)
        expect(File.exists?(DEFAULT_BACKUP_DIR+FILENAME)).to be_true
      end
    end

    context 'when a custom backup dir is given' do
      before(:each) do
        @backup_guy = BackupGuy.new backup_dir: CUSTOM_BACKUP_DIR 
      end

      it 'creates the backup in the custom directory' do
        @backup_guy.backup(TEST_FILE)
        expect(File.exists?(CUSTOM_BACKUP_DIR+FILENAME)).to be_true
      end
    end

  end
end
