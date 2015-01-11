class Processor
  def self.process(input_file, output_dir)
    output_dir = File.expand_path(output_dir)
    works = process_args input_file, output_dir
    output_template = File.read('./output-template.html')

    ## GENERATE MODEL ##
    works.uniq_model.each do |model|
      model_builder = ModelBuilder.new(works, model)
      File.write(
        "#{output_dir}/#{model.downcase.gsub(' ','_')}.html", 
        TemplateBuilder.build(output_template, model_builder)
      )
    end
    ## GENERATE MAKE ##
    works.uniq_make.each do |make|
      make_builder = MakeBuilder.new(works, make)
      File.write(
        "#{output_dir}/#{make.downcase.gsub(' ','_')}.html", 
        TemplateBuilder.build(output_template, make_builder)
      )
    end
    ## GENERATE INDEX ##
    index_builder = IndexBuilder.new(works)
    File.write(
      "#{output_dir}/index.html", 
      TemplateBuilder.build(output_template, index_builder)
    )
  end

private
  def self.process_args(input_file, output_dir)
    begin
      file = File.open(input_file, "r")
    rescue Errno::ENOENT
      raise InvalidInputFileError, "Invalid Input File"
    end

    unless File.directory?(output_dir)
      FileUtils.mkdir_p(output_dir)
    end

    Works.new file
  end
end

class ProcessorError < StandardError
end
class InvalidInputFileError < ProcessorError
end
