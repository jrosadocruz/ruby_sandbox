def grandma
  bye = 0

  print "Say something to Grandma: "
  say = gets.chomp
  shout = say.upcase

  while true
    bye += 1 if say == "BYE"
    break if bye == 3

    if say != shout
      puts "Grandma says: HUH! SPEAK UP, SONNY! \n\n"
      print "Say something to Grandma: "
      say = gets.chomp
    elsif say == shout
      puts "\nGrandma says: NO, NOT SINCE #{random_year}!"
      print "Say something to Grandma: "
      say = gets.chomp
    end
  end

  puts "\nGrandma says: BYE, SONNY!"

end

def random_year
  return rand(1938..2015)
end

grandma
# puts random_year