require 'restaurant'

class Guide

  def initialize(path=nil)

    # locate file
    Restaurant.filepath = path

    if Restaurant.file_usable?
      puts "Found restaurant file"
    elsif Restaurant.create_file
      puts "Create restaurant file"
    else
      puts "Exiting program"
      exit!
    end

    # or create new file

    # exit if fails
  end

  def launch!
    introduction
    # action loop
    #   What to do? (list, find, add, quit)
    #   do action
    # repeat until user quits
    conclusion
  end

  def introduction
    puts "\n\n <<< Welcome to the Food Finder >>>"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appettit! >>> \n\n\n"
  end

end