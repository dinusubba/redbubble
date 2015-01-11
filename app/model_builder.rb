require './application'

class ModelBuilder
  def initialize(works, model)
    @works = works
    @model = model
    @make = @works.make_of_model(@model)
  end

  def title
    "Redbubble | #{@make} | #{@model}"
  end

  # Navigation that allows the user to browse to the index page and the camera make
  def nav
    html = ""
    html << HtmlHelper.index_button
    html << HtmlHelper.single_button_link(@make)
    HtmlHelper.wrap_in_button_group html
  end

  # Thumbnail images of all works for that camera make and model
  def thumbs
    html = ""
    image_urls = @works.image_urls_of_make_model(@make, @model)
    image_urls.each do |image_url|
      html << HtmlHelper.single_img(image_url)
    end
    HtmlHelper.wrap_in_block_ul html
  end
end
