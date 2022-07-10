require_relative "transform"

class UniqView
    attr_reader :data
    def initialize(data)
        @data = data
    end

    def view
        if data
            uniq_views_output = []
            sorted = data.sort_by{ |k, v| v.uniq.count }.reverse.to_h
            sorted.each do |key, val|
                params = {data: nil, count: val.count}
                uniq_views_output << "#{key} -> #{val.uniq.count} uniq #{Transform.new(params).pluralize}"
            end
            uniq_views_output.join(",")
        else
            'Invalid File data'
        end
    end
end

