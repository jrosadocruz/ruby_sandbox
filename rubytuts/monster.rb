class Monster
  attr_reader :name, :actions

  def initialize(name)
    @name = name
    @actions = {
      screams: 0,
      scares: 0,
      runs: 0,
      hides: 0
    }
  end

  def say(&block)
    print "#{name} says... "
    block.call
  end

  def scream(&block)
    actions[:screams] += 1
    print "#{name} screams! "
    yield
  end

  def scare(&block)
    actions[:scares] += 1
    print "#{name} scares you! "
    yield
  end

  def run(&block)
    actions[:runs] += 1
    print "#{name} runs after you! "
    yield
  end

  def hide(&block)
    actions[:hides] += 1
    print "#{name} hides from you! "
    yield
  end

  def print_scores
    divisor("-")
    puts "\n"
    puts "#{name} scores"
    divisor("-")
    puts "\n"
    puts "Screams:".ljust(39) +  "#{actions[:screams]}"
    puts "Scares:".ljust(39)  +  "#{actions[:scares]}"
    puts "Runs:".ljust(39)    +  "#{actions[:runs]}"
    puts "Hides:".ljust(39)   +  "#{actions[:hides]}"
  end

  def divisor(char)
    40.times { print "#{char}"}
  end

end

monster = Monster.new("Fluffy")
monster.say { puts "I'm a big monster." }

monster.scream do
  puts "Boo!"
end

monster.scare do
  puts "GO AWAY!!!"
end

monster.run do
  puts "But you got away!!!"
end
monster.hide do
  puts "You win!!!"
end

puts monster.actions

monster.print_scores