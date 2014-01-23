require 'fileutils'
class BackupGuy
  DEFAULT_BACKUP_DIR = File.expand_path("~/.count_updater/")+"/"

  def initialize(options={})
    @backup_dir = options[:backup_dir] || DEFAULT_BACKUP_DIR
    @backed_up_files = []
  end

  def backup(*files)
    create_backup_dir
    files.each do |file|
      @backed_up_files << backup_file(file)
    end
  end

  private
  def backup_file(file)
    backup_filename = "#{@backup_dir}#{File.basename(file)}"
    FileUtils.cp(file,backup_filename)
    return backup_filename
  end

  def create_backup_dir
    FileUtils.mkpath(@backup_dir)
  end
end

