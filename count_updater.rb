lib_files = File.join("lib","*.rb")
Dir.glob(lib_files).each { |file| require_relative "./#{file}" }

