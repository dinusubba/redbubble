class Work
  attr_reader :id, :make, :model, :image_url

  def initialize(work)
    @work = work
    read_xml_doc
  end

  def read_xml_doc
    @id = get_id
    @image_url = get_image_url
    @make, @model = get_make_model
  end

  def get_id
    @work.search('id').text.to_i
  end

  def get_image_url
    urls = @work.search('urls').first
    urls.search('url[type="large"]').first.text
  end

  def get_make_model
    exif = @work.search('exif').first
    return exif.search('make').text, exif.search('model').text
  end

end
