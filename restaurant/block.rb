def div(id, css_class, content="")
  content = yield if block_given?
  "<div class='#{css_class}' id='#{id}'>\n#{content}\n</div>"
end

def paragraph &block
  "<p>#{block.call}</p>" if block_given?
end

div = div("div1", "levi") do
  string = paragraph {'Jose is awesome'}
  string += paragraph { 'So is Levi' }
end

# puts div


def content_tag (type = 'div', opt={}, content = '')
  string  = "<#{type}"
  string += " id='#{opt[:id]}'"        if opt[:id]
  string += " class='#{opt[:class]}'"  if opt[:class]
  string += ">"
  content = yield if block_given?
  string += content.to_s
  string += "</#{type}>"
end


jos = content_tag("div", {class: "nav", id: "navbar"}) do
  # string ="\n"
  # string += paragraph {'Jose is awesome'} + "\n"
  # string += paragraph { 'So is Levi' } + "\n"
  content_tag("p",{}, "José")
  content_tag("legend",{}, "input")
end

puts jos
