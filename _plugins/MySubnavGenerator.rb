require "nokogiri"

class MySubnavGenerator < Jekyll::Generator
  def generate(site)
    parser = Jekyll::Converters::Markdown.new(site.config)
    p "test"
    site.pages.each do |page|
      if page.ext == ".md"
        doc = Nokogiri::HTML(parser.convert(page['content']))
        page.data["subnav"] = []
        doc.css('h2').each do |heading|
          #page.data["subnav"] << { "title" => heading.text, "url" => [page.url, heading['id']].join("#") }
          page.data["subnav"] << { "title" => heading.text, "url" => ["#", heading['id']].join("") }
        end
      end
    end
  end
end
