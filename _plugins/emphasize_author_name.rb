require "nokogiri"

Jekyll::Hooks.register [:pages, :documents], :post_render do |page|
  next unless page.output_ext == ".html"

  name = page.site.config.values_at("first_name", "middle_name", "last_name").compact.join(" ").strip
  next if name.empty?

  pattern = Regexp.new(name.split.map { |part| Regexp.escape(part) }.join("\\s+"))
  document = Nokogiri::HTML(page.output)
  about_page = page.data["layout"] == "about"

  document.xpath("//body//text()").each do |text_node|
    text = text_node.content
    next unless text.match?(pattern)

    excluded = text_node.ancestors.any? do |ancestor|
      classes = ancestor["class"].to_s.split
      %w[script style textarea pre code strong b].include?(ancestor.name) ||
        classes.include?("navbar-brand") ||
        (about_page && classes.include?("post"))
    end
    next if excluded

    fragment = Nokogiri::HTML::DocumentFragment.new(document)
    offset = 0
    text.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      fragment.add_child(Nokogiri::XML::Text.new(text[offset...match.begin(0)], document))
      emphasis = Nokogiri::XML::Node.new("strong", document)
      emphasis["class"] = "author-name"
      emphasis.content = match[0]
      fragment.add_child(emphasis)
      offset = match.end(0)
    end
    fragment.add_child(Nokogiri::XML::Text.new(text[offset..], document))
    text_node.replace(fragment)
  end

  page.output = document.to_html
end
