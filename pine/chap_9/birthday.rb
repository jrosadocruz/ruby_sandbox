# Happy Birthday! Ask what year a person was born in, then the month, then the
# day. Figure out how old they are and give them a big SPANK! for each birthday
# they have had.
print "Year you were born: "
year = gets.chomp

print "Month: "
month = gets.chomp

print "Day: "
day = gets.chomp


birth = Time.mktime(year, month, day)
now = Time.now
my_age  = ((now - birth)/(525949*60)).to_i
puts "I'm #{my_age} years old"

15.times { |n|  puts "HBD!!! --SPANK no.#{n+1}--" }