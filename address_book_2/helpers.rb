# Replace latin characters
# This removes accents fromt UTF-8 international characters
# http://stackoverflow.com/a/1272311
class String
  def remove_non_ascii
    require 'iconv'
    Iconv.conv('ASCII//IGNORE', 'UTF8', self)
  end
end

