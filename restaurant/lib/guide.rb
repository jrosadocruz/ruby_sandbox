require 'restaurant'

class Guide

  class Config
    @@actions = ['list','find','add','quit']
    def self.actions; @@actions; end
  end

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
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    #   do action
    # repeat until user quits
    conclusion
  end

  def get_action
    action = nil
    # Keep asking for input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when 'list'
      list
    when 'find'
      puts "finding..."
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command. \n"
    end
  end

  def add
    puts "\nAdd a new restaurant\n\n".upcase

    restaurant = Restaurant.build_from_questions

    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: restaurant not added\n\n"
    end
  end

  def introduction
    puts "\n\n <<< Welcome to the Food Finder >>>"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appettit! >>> \n\n"
  end

end