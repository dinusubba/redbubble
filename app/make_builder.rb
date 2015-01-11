require './application'

class MakeBuilder
  def initialize(works, make)
    @works = works
    @make = make
  end

  def title
    "Redbubble | #{@make}"
  end

  # Navigation that allows the user to browse to the index page and to all camera models of that make
  def nav
    html = ""
    html << HtmlHelper.index_button

    models = @works.models(@make)
    models.each do |model|
      html << HtmlHelper.single_button_link(model)
    end

    HtmlHelper.wrap_in_button_group html
  end

  # Thumbnail images of the first 10 works for that camera make
  def thumbs
    html = ""
    image_urls = @works.image_urls_of_make(@make)
    image_urls.each do |image_url|
      html << HtmlHelper.single_img(image_url)
    end
    HtmlHelper.wrap_in_block_ul(html)
  end
end
