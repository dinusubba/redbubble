require './application'

class MakeBuilder
  def initialize(works, make)
    @works = works
    @make = make
  end

  def title
    "#{@make}"
  end

  # Navigation that allows the user to browse to the index page and to all camera models of that make
  def nav
    html = ""
    html << HtmlHelper.index_button
    uniq_model = []
    @works.works.each do |work|
      next unless work.make == @make
      uniq_model << work.model
    end
    uniq_model.uniq.each do |model|
      html << HtmlHelper.single_button_link(model)
    end
    HtmlHelper.wrap_in_button_group html
  end

  # Thumbnail images of the first 10 works for that camera make
  def thumbs
    image_urls = []
    @works.works.each do |work|
      next unless work.make == @make
      image_urls << work.image_url
      break if image_urls.size == 10
    end
    html = ""
    image_urls.each do |image_url|
      html << HtmlHelper.single_img(image_url)
    end
    HtmlHelper.wrap_in_block_ul(html)
  end
end
