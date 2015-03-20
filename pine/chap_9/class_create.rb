class Die

  def roll
    1 + rand(6)
  end

end

dies = [Die.new, Die.new]
dies.each { |die| puts die.roll }