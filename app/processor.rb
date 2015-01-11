class Processor
  def self.process(input_file, output_dir)
    process_args input_file, output_dir
    @output_template = File.read('./output-template.html')

    @works = Works.new @file

    # Magic happens here
    abracadabra
  end

private
  def self.process_args(input_file, output_dir)
    begin
      @file = File.open(File.expand_path(input_file), "r")
    rescue Errno::ENOENT
      raise InvalidInputFileError, "Invalid Input File"
    end

    begin
      @output_dir = File.expand_path(output_dir)
      unless File.directory?(output_dir)
        FileUtils.mkdir_p(output_dir)
      end
    rescue Errno::EEXIST
      raise OutputDirError, "Invalid Output Directory"
    end
  end

  def self.abracadabra
    self.generate_models
    self.generate_makes
    self.generate_index
  end

  def self.generate_models
    @works.models.each do |model|
      model_builder = ModelBuilder.new(@works, model)
      File.write(
        "#{@output_dir}/#{HtmlHelper.format_url(model)}",
        TemplateBuilder.build(@output_template, model_builder)
      )
    end
  end

  def self.generate_makes
    @works.makes.each do |make|
      make_builder = MakeBuilder.new(@works, make)
      File.write(
        "#{@output_dir}/#{HtmlHelper.format_url(make)}",
        TemplateBuilder.build(@output_template, make_builder)
      )
    end
  end

  def self.generate_index
    index_builder = IndexBuilder.new(@works)
    File.write(
      "#{@output_dir}/index.html", 
      TemplateBuilder.build(@output_template, index_builder)
    )
  end
end

class ProcessorError < StandardError
end
class InvalidInputFileError < ProcessorError
end
class OutputDirError < ProcessorError
end
