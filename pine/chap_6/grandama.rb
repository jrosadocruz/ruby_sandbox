def grandma
  bye = 0

  print "Say something to Grandma: "
  say = gets.chomp

  shout = say.upcase

  while say == shout
    if say == "BYE"
      bye += 1
    end
    break if bye == 3
    puts "\nGrandma says: NO, NOT SINCE #{random_year}!"
    print "Say something to Grandma: "
    say = gets.chomp
  end

  while say != shout
    puts "Grandma says: HUH! SPEAK UP, SONNY! \n\n"
    print "Say something to Grandma: "
    say = gets.chomp
  end

  puts "\nGrandma says: BYE, SONNY!"

end

def random_year
  return rand(1938..2015)
end

grandma
# puts random_year