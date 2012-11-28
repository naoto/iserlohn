module Iserlohn
  class Upload

    attr_reader :filename

    def self.file(files)
      upload = new(files)
      upload.filename
    end

    def initialize(files)
      @files = files
      save
    end

    def save
      File.open("#{File.dirname(__FILE__)}/../../public/files/#{filename}", 'wb'){ |f|
        f.write tempfile.read if file_upload?
      }
    end

    def filename
      @filename ||= "#{Time.now.to_i}_#{@files[:filename]}"
    end

    def tempfile
      @files[:tempfile]
    end

    def file_upload?
      !@files.nil?
    end

  end
end
