class OrangeTree
  attr_reader :height, :age, :oranges

  def initialize
    @height = 0
    @age = 0
    @oranges = 0
    @dead = false
  end

  def one_year_passes
    @age    += 1
    @height += 1
    @oranges = 0

    if age > 15
      dies
      exit
    end

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
      puts "Ummm! Juicy!!!"
    else
      puts "There are no oranges in your tree"
    end
  end

  def countTheOranges
    puts "Your orange tree has no oranges\n\n" if oranges == 0
    puts "Your orange tree has 1 orange\n\n"   if oranges == 1
    puts "Your orange tree has #{oranges} oranges\n\n" if oranges > 1
  end

  def dies
    @dead = true
    puts "Your tree died of old age."
  end

end

new_tree = OrangeTree.new
# puts new_tree.height, new_tree.age, new_tree.oranges

new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
new_tree.one_year_passes
puts new_tree.age
