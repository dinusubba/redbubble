require './application'

class IndexBuilder
  def initialize(works)
    @works = works
  end

  def title
    "Index"
  end

  # Navigation that allows the user to browse to all camera makes
  def nav
    html = ""
    html << HtmlHelper.index_button(false)
    @works.uniq_make.each do |make|
      next if make.empty?
      html << HtmlHelper.single_button_link(make)
    end
    HtmlHelper.wrap_in_button_group(html)
  end

  # Thumbnail images for the first 10 work
  def thumbs
    html = ""
    @works.works.first(10).each do |work|
      html << HtmlHelper.single_img(work.image_url)
    end
    HtmlHelper.wrap_in_block_ul html
  end
end
