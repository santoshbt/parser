require_relative "transform"

class PageView
    attr_reader :data
    def initialize(data)
        @data = data
    end

    def view
        if data
            page_view_output = []
            sorted = data.sort_by{ |k, v| v.count }.reverse.to_h
            sorted.each do |key, val|
                params = {data: nil, count: val.count}
                page_view_output << "#{key} -> #{val.count} #{Transform.new(params).pluralize}"
            end
            page_view_output.join(",")
        else
            'Invalid File data'
        end
    end
end