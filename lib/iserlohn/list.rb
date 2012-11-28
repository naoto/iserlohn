module Iserlohn
  class List

    def initialize
      @files = Dir.entries("#{File.dirname(__FILE__)}/../../public/files")
    end

    def each
      @files.each do |f|
        next if File.directory?("#{File.dirname(__FILE__)}/../../public/files/#{f}")
        yield f
      end
    end

  end
end
