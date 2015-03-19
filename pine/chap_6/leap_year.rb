# LEAP YEAR PROGRAM

print "Starting year: "
start_year = gets.chomp.to_i

print "Ending year: "
ending_year = gets.chomp.to_i

# while start_year <= ending_year
#   if start_year % 400 == 0
#     puts start_year
#   elsif start_year % 100 == 0
#   elsif start_year % 4 == 0
#     puts start_year
#   end
#   start_year += 1
# end

# more Ruby-esq?
start_year.upto(ending_year) do |year|
  if year % 100 == 0  &&  year % 400 != 0
  elsif year % 4 == 0
    puts year
  end
end