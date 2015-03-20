time = Time.new
time2 = Time.new + 60 # one minute later
# puts time
# puts time2

# Add commas to thousands
# Found in http://codereview.stackexchange.com/a/28066
class Fixnum
  def add_comma
    self.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end

# Specific time
jose = Time.mktime(1987, 6, 13) # year, month, day
jose_seconds = jose

# One billion seconds... Find out the exact second you were born (if you can).
# Figure out when you will turn (or perhaps when you did turn?) one billion
# seconds old. Then go mark your calendar.
puts "I'm #{jose_seconds.to_i.add_comma} seconds old."

# Time till my one billion-th second
time_to_billion = (1000000000 - jose_seconds.to_i)
date_to_billion = Time.now + time_to_billion
puts "I'll be a billion seconds old in #{time_to_billion.to_i} second."
puts "I'll be a billion seconds old on #{date_to_billion}"
puts "Hours till my billion-th second: #{(date_to_billion.to_i/60/60).add_comma}"