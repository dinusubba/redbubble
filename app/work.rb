class Work
  attr_reader :id, :make, :model

  def initialize(work)
    @work = work
    read_xml_doc
  end

  def read_xml_doc
    @id = @work.child.search('id').text.to_i
    exif = @work.search('exif').first
    @make = exif.search('make').text
    @model = exif.search('model').text
  end
end
