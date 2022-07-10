class FileReader
    attr_reader :file_path

    def initialize(file_path)
        @file_path = file_path
    end

    def parse_file
        begin
            file = File.open(file_path)
            File.read(file)
        rescue => exception
            'File not found'
        end
    end
end
