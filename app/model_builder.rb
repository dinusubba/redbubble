require './application'

class ModelBuilder
  def initialize(works, model)
    @works = works
    @model = model
    @works.works.each do |work|
      if work.model == @model
        @make = work.make
        break
      end
    end
  end

  def title
    "#{@model}"
  end

  # Navigation that allows the user to browse to the index page and the camera make
  ######### RED ALERT HERE ############
  ######## MAKE CAMERA MAKE ACCESSIBLE
  def nav
    html = ""
    html << HtmlHelper.index_button
    html << HtmlHelper.single_button_link(@make)
    HtmlHelper.wrap_in_button_group html
  end

  # Thumbnail images of all works for that camera make and model
  ######### RED ALERT HERE ############
  def thumbs
    image_urls = []
    @works.works.each do |work|
      next unless work.model == @model
      image_urls << work.image_url
    end
    html = ""
    image_urls.each do |image_url|
      html << HtmlHelper.single_img(image_url)
    end
    HtmlHelper.wrap_in_block_ul html
  end
end
