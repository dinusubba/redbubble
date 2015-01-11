require './application'

class IndexBuilder
  def initialize(works)
    @works = works
  end

  def title
    "Redbubble | Index"
  end

  # Navigation that allows the user to browse to all camera makes
  def nav
    html = ""
    html << HtmlHelper.index_button(false)
    @works.makes.each do |make|
      next if make.empty?
      html << HtmlHelper.single_button_link(make)
    end
    HtmlHelper.wrap_in_button_group(html)
  end

  # Thumbnail images for the first 10 work
  def thumbs
    html = ""
    @works.image_urls.each do |image_url|
      html << HtmlHelper.single_img(image_url)
    end
    HtmlHelper.wrap_in_block_ul html
  end
end
