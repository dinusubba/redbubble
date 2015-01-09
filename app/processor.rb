class Processor
  def initialize(input_file=nil, output_dir=nil)
    @input_file = input_file
    @output_dir = output_dir
    check_params
    open_file
  end

  def check_params
    raise NoInputFileError if @input_file.nil?
    raise NoOutputDirError if @output_dir.nil?
  end

  def open_file
    @file = File.open(@input_file, "r")
  end

  

  ## MAIN FUNCION ##
  def abracadabra
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
