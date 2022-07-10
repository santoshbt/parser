require_relative "lib/parser"

describe Parser, "#page_views" do
    before(:all) do
        path = File.expand_path(Dir.pwd)
        @file_path_1 = path + '/webserver.log'
        @file_path_2 = 'webserver1.log'
    end

    it 'returns the number of views sorted from high to low' do
        page_views = described_class.new(@file_path_1).page_views
        expect(page_views).to eq("/about/2 -> 90 views,/contact -> 89 views,/index -> 82 views,/about -> 81 views,/help_page/1 -> 80 views,/home -> 78 views")
    end

    it 'returns Invalid File data for invalid file' do
        page_views = described_class.new(@file_path_2).page_views
        expect(page_views).to eq("Invalid File data")
    end
end

describe Parser, "#uniq_views" do
    before(:all) do
        path = File.expand_path(Dir.pwd)
        @file_path_1 = path + '/webserver.log'
        @file_path_2 = 'webserver1.log'
    end

    it 'returns the number of views sorted from high to low' do
        uniq_views = described_class.new(@file_path_1).uniq_views
        expect(uniq_views).to eq("/index -> 23 uniq views,/home -> 23 uniq views,/contact -> 23 uniq views,/help_page/1 -> 23 uniq views,/about/2 -> 22 uniq views,/about -> 21 uniq views")
    end

    it 'returns Invalid File data for invalid file' do
        uniq_views = described_class.new(@file_path_2).uniq_views
        expect(uniq_views).to eq("Invalid File data")
    end
end