class Processor
  def initialize(input_file=nil, output_dir=nil)
    @input_file = input_file
    @output_dir = output_dir
    check_params
    read_input_file
  end

  ## MAIN FUNCION ##
  def abracadabra
  end

  def works
    @works
  end

private
  def check_params
    raise NoInputFileError if @input_file.nil?
    raise NoOutputDirError if @output_dir.nil?
  end

  def read_input_file
    @file = File.open(@input_file, "r")
    @doc = Nokogiri::XML(@file) do |config|
      config.noblanks
    end
    @works = @doc.child
  end

  def process_works
    @works.children.each do |work|
      # Work.new
    end
  end
end

class ProcessorError < StandardError
end
class NoInputFileError < ProcessorError
end
class NoOutputDirError < ProcessorError
end
class InvalidInputFileError < ProcessorError
end
