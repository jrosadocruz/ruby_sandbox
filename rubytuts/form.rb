def form &block
  puts "<form>"
  yield
  puts "</form>"
end

def paragraph text
  puts "<p>" + text + "</p>"
end

def quote text
  puts "<blockquote>" + text + "</blockquote>"
end

form do
  paragraph "This is my first paragraph"
  quote "\"A blockquote\""
  paragraph "Another paragraph"
end
