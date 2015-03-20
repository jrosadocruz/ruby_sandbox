class OrangeTree
  attr_reader :age, :oranges

  def initialize
    @age     = 0
    @oranges = 0
    @dead    = false
    init!
  end

  def init!
    puts "You planted a new tree!!!"
    puts "Please way 3 years for it to grow some oranges\n\n" if age <= 3

    puts "Wait 3 year? y/n"
    print "> "
    input = gets.chomp.downcase

    # Loop until 'y' or 'n' is passed
    while input != "y"
      if input == "n"
        puts "Too bad. Oranges are a great source of vitamin C"
        exit
      end
      puts "y/n?"
      print "> "
      input = gets.chomp.downcase
    end

    puts "Tree year have pass!"
    # The tree needs to be 3 years old to give fruits
    3.times { one_year_passes }
    puts "Your tree has #{oranges} oranges."

    print_menu

  end

  def print_menu
    # Loop over the actions you with the user to do.
    loop do
      puts "\nWhat do you wish to do?"
      puts "Y: Year pass\nP: Pick Orange\nC: Count oranges \nE: exit"
      print "> "
      choice = gets.chomp.downcase

      case choice
      when 'y'
        one_year_passes
      when 'p'
        pickAnOrange
      when 'c'
        countTheOranges
      when 'e'
        "Bye!"
        break
      else
        print "Please enter you choice > "
        choice = gets.chomp.downcase
      end
    end

  end

  def one_year_passes
    @age    += 1
    @oranges = 0
    if age > 15
      dies
      exit
    end

    puts "A year has passed. Your tree has #{age} years."

    if age >= 7
      add_oranges(17)
    elsif age >= 5
      add_oranges(15)
    elsif age >= 3
      add_oranges(10)
    end

  end

  def add_oranges(quantity)
    @oranges += quantity
  end

  def pickAnOrange
    if @oranges > 0
      @oranges -= 1
      countTheOranges
    else
      countTheOranges
    end
  end

  def countTheOranges
    puts "Your orange tree has no oranges\n" if oranges == 0
    puts "Your orange tree has 1 orange\n"   if oranges == 1
    puts "Your orange tree has #{oranges} oranges\n" if oranges > 1
  end

  def dies
    @dead = true
    puts "Your tree died of old age."
  end

end

new_tree = OrangeTree.new
