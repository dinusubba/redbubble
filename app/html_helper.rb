class HtmlHelper
  def self.index_button(enabled=true)
    disabled = enabled ? "" : "disabled"
    self.single_button_link "Index", disabled
  end

  def self.wrap_in_button_group(html)
    "<ul class=\"button-group\">" + 
    html + 
    "</ul>"
  end

  def self.single_button_link(text, extra_class=nil)
    link = self.format_url text
    html = ""
    html << "<li>"
    html << "<a class=\"#{extra_class} small button\" href=\"#{link}\">"
    html << "#{text}"
    html << "</a>"
    html << "</li>"
  end

  def self.single_img(image_url)
    html = ""
    html << "<li>"
    html << "<img class=\"th\" src=\"#{image_url}\"></img>"
    html << "</li>"
  end

  def self.wrap_in_block_ul(html)
    "<ul class=\"small-block-grid-2 large-block-grid-5\">" +
    html +
    "</ul>"
  end

  def self.format_url(text)
    "#{text.downcase.gsub(' ','_')}.html"
  end
end
