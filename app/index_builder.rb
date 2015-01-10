require './application'

class IndexBuilder
  def initialize(works)
    @works = works
  end

  def title
    "Index"
  end

  def nav
    html = "<div class=\"nav\"><ul>"
    @works.uniq_make.each do |make|
      html << "<li>"
      html << "<a href=\"#{make.downcase.gsub(' ','_')}.html\">"
      html << "#{make}"
      html << "</a>"
      html << "</li>"
    end
    html << "</ul></div>"
  end

  def thumbs
    html = "<div class=\"thumbs\">"
    @works.works.first(10).each do |work|
      html << "<div class=\"thumb\">"
      html << "<img src=\"#{work.image_url}\"></img>"
      html << "</div>"
    end
    html << "</div>"
  end
end
