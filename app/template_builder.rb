require './application'

class TemplateBuilder
  def self.build(template, builder)
    template = insert_build template, builder
    template = insert_nav template, builder
    template = insert_thumbs template, builder

    template
  end

private
  def self.insert_build(template, builder)
    template.gsub '{{ TITLE GOES HERE }}', builder.title
  end

  def self.insert_nav(template, builder)
    template.gsub '{{ NAVIGATION GOES HERE }}', builder.nav
  end

  def self.insert_thumbs(template, builder)
    template.gsub '{{ THUMBNAIL IMAGES GO HERE }}', builder.thumbs
  end
end
