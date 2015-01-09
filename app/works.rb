class Works
  attr_reader :works

  def initialize(file)
    @file = file
    parse_xml
  end

private
  def parse_xml
    @doc = Nokogiri::XML(@file) do |config|
      config.noblanks
    end
    @works = []
    @doc.child.children.each do |child_node|
      @works << Work.new(child_node)
    end
  end
end

