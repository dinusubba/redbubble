class Processor
  def self.process(input_file, output_dir)
    @input_file = input_file
    @output_dir = output_dir
    process_args
  end

private
  def self.process_args
    begin
      @file = File.open(@input_file, "r")
    rescue Errno::ENOENT
      raise InvalidInputFileError, "Invalid Input File"
    end

    # TODO: check output dir

    Works.new @file
  end
end

class ProcessorError < StandardError
end
class InvalidInputFileError < ProcessorError
end
