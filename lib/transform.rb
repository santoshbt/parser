class Transform
    def initialize(params)
        @data = params[:data]
        @count = params[:count]
    end

    def process
        unless @data == 'File not found' || @data.nil?
            data = @data.split(' ')
            data_list = data.each_slice(2).to_a
            data_list.group_by {|(page, user_ip)| page }.to_h
        end
    end

    def pluralize
        return if @count.nil?
        @count > 1 ? "views" : "view"
    end
end
