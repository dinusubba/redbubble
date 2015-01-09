class Processor
  def initialize(input_file, output_dir)
    @input_file = input_file
    @output_dir = output_dir
    process_args
  end

  ## MAIN FUNCION ##
  def abracadabra
    process_works
  end

  def works_count
    @works.count
  end

private
  def process_args
    begin
      @file = File.open(@input_file, "r")
    rescue Errno::ENOENT
      raise InvalidInputFileError, "Invalid Input File"
    end

    @doc = Nokogiri::XML(@file) do |config|
      config.noblanks
    end
    @works = []
    @doc.child.children.each do |child_node|
      @works << Work.new(child_node)
    end
  end

  def get_all_make
    @all_make = []
    @works.each do |work|
    end
  end
end

class ProcessorError < StandardError
end
class InvalidInputFileError < ProcessorError
end
