class Works
  attr_reader :works, :uniq_make, :uniq_model

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
    all_make = []
    all_model = []

    @doc.child.children.each do |child_node|
      work = Work.new(child_node)
      @works << work
      all_make << work.make
      all_model << work.model
    end

    uniqfy_make_model all_make, all_model
  end

  def uniqfy_make_model(all_make, all_model)
    @uniq_make = all_make.uniq!
    @uniq_model = all_model.uniq!
  end
end
