require_relative "file_reader"
require_relative "page_view"
require_relative "uniq_view"
require_relative "transform"

class Parser
    def initialize(file_path)
        @file_path = file_path
        @data = FileReader.new(file_path).parse_file
    end

    def page_views
        params = {data: @data}
        data_hash = Transform.new(params).process
        PageView.new(data_hash).view
    end

    def uniq_views
        params = {data: @data}
        data_hash = Transform.new(params).process
        UniqView.new(data_hash).view
    end
end


path = File.expand_path(Dir.pwd)
lg = Parser.new(path + '/webserver.log')
p "========== page Views ======="
p lg.page_views
p "======== Uniq Views ========="
p lg.uniq_views