class Works
  attr_reader :all_work

  def initialize(xml) # xml could be xml string or xml file handle
    @xml = xml
    @all_work = []

    parse_xml
  end

  # returns array of uniq models str (filtered by make)
  def models(make=nil)
    arr = []
    @all_work.each do |work|
      next if work.model.empty?
      if make # if filtered by make
        arr << work.model if work.make == make
      else  # everything
        arr << work.model
      end
    end
    arr.uniq
  end

  # returns array of uniq makes str
  def makes
    arr = []
    @all_work.each do |work|
      next if work.make.empty?
      arr << work.make
    end
    arr.uniq
  end

  # returns make str of model
  def make_of_model(model)
    all_work.each do |work|
      return work.make if work.model == model
    end
  end

  def image_urls(count=10)
    arr = []
    all_work.each do |work|
      arr << work.image_url
      break if arr.size == count
    end
    arr
  end

  #returns image urls str of make
  def image_urls_of_make(make, count=10)
    arr = []
    all_work.each do |work|
      arr << work.image_url if work.make == make
      break if arr.size == count
    end
    arr
  end

  def image_urls_of_make_model(make, model)
    arr = []
    all_work.each do |work|
      if work.make == make
        if work.model == model
          arr << work.image_url
        end
      end
    end
    arr
  end

private
  def parse_xml
    @doc = Nokogiri::XML(@xml) do |config|
      config.noblanks
    end

    unless @doc.child.nil?
      @doc.child.children.each do |child_node|
        work = Work.new(child_node)
        @all_work << work
      end
    end
  end
end
