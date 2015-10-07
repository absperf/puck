if PUCK_EXE_PATH
  if File.exist?("classpath:/#{PUCK_EXE_PATH}")
    $0 = PUCK_EXE_PATH
    load(PUCK_EXE_PATH)
    exit
  else
    abort(%(Executable "#{PUCK_EXE_PATH}" not found in classpath.))
  end
else
  if ARGV.any?
    file_name = ARGV.shift
    PUCK_BIN_PATH.each do |dir|
      relative_path = File.join(dir, file_name)
      if File.exists?("classpath:/#{relative_path}")
        $0 = relative_path
        load(relative_path)
        exit
      end
    end
    abort(%(No "#{file_name}" in #{PUCK_BIN_PATH.join(File::PATH_SEPARATOR)}))
  end
end
