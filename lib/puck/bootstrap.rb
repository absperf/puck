def __launch_puck_executable_safely__(exe, *paths)
  paths.each do |path|
    file_path = File.join(path, exe)

    if File.exist?("classpath:/#{file_path}")
      $0 = file_path
      load(file_path)
      exit
    end
  end

  abort "Executable #{exe.inspect} not found in #{paths.join File::PATH_SEPARATOR}"
end

if PUCK_EXE_NAME.empty?
  if ARGV.any?
    __launch_puck_executable_safely__ ARGV.shift, *PUCK_BIN_PATH
  end
else
  __launch_puck_executable_safely__ PUCK_EXE_NAME, PUCK_EXE_PATH
end
