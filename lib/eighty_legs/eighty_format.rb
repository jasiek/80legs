module EightyLegs
  class EightyFormat
    def initialize(filename_or_io)
      if filename_or_io.is_a?(String)
        initialize_with_filename(filename_or_io)
      elsif filename_or_io.is_a?(IO)
        initialize_with_io(filename_or_io)
      else
        raise TypeError.new(filename_or_io.class)
      end
      check_for_classid_and_version()
    end

    def initialize_with_filename(filename)
      initialize_with_io(File.open(filename))
    end

    def initialize_with_io(io)
      @io = io
    end

    def each(&blk)
      while not @io.eof?
        url_size = @io.read(4).unpack("i").first
        url = @io.read(url_size)
        data_size = @io.read(4).unpack("i").first
        data = @io.read(data_size)
        blk.call(Entry.new(url, data))
      end
      @io.seek(8, IO::SEEK_SET)
    end

    private
    def check_for_classid_and_version
      @io.rewind
      classid, version = @io.read(8).unpack("ii")
      raise FileFormatError unless [classid, version] == [218217067, 1]
    end

    class FileFormatError < EightyError; end
  end
end
