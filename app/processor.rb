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

  def works
    @works
  end

private
  def process_args
    @file = File.open(@input_file, "r")
    raise InvalidInputFileError unless @file

    @doc = Nokogiri::XML(@file) do |config|
      config.noblanks
    end
    @works = @doc.child
  end

  def process_works
    @children = []
    @works.children.each do |work|
      @children << Work.new(work)
    end
  end
end

class ProcessorError < StandardError
end
class InvalidInputFileError < ProcessorError
end
