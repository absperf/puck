# encoding: utf-8

module Puck
  PuckError = Class.new(StandardError)
  GemNotFoundError = Class.new(PuckError)

  def self.launch(exe, *paths)
    paths.each do |path|
      file_path = File.join(path, exe)

      if File.exist?("classpath:/#{file_path}")
        $0 = file_path
        load(file_path)
        exit
      end
    end

    abort "Executable '#{exe}' not found in '#{paths.join File::PATH_SEPARATOR}'"
  end
end

require 'puck/configuration'
require 'puck/dependency_resolver'
require 'puck/jar'
