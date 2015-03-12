require 'restaurant'

class Guide

  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions
      @@actions
    end
  end

  def initialize(path=nil)

    Restaurant.filepath = path
    if Restaurant.file_usable? # locate the restaurant file
      puts "Found restaurant file."
    elsif Restaurant.create_file # or create a new file
      puts "Created restaurant file."
    else # exit if creates fails
      puts "Exiting.\n\n"
      exit!
    end

  end

  def launch!
    introduction
    # action loop
    result = nil
    until result == :quit
      action = get_action #   What do you want to do? (list, find, add, quit)
      result = do_action(action) #   do that action
    end
    conclusion
  end

  def get_action
    action = nil
    # Keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ")
      print "> "
      user_responce = gets.chomp
      action = user_responce.downcase.strip
    end
    action
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing..."
    when 'find'
      puts "Finding"
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "I don't understand that command"
    end
  end

  def add
    puts "\nAdd a restaurant\n\n".upcase
    restaurant = Restaurant.new

    print "Restaurant name: "
    restaurant.name = gets.chomp.strip

    print "Cuisine type: "
    restaurant.cuisine = gets.chomp.strip

    print "Average price: "
    restaurant.price =gets.chomp.strip

    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave error: restaurant not added\n\n"
    end

  end

  def introduction
    puts "\n\n <<< Welcome to the food finder >>> \n\n"
    puts "This is an interactive guide to help you find the food you crave. \n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appetit! >>>\n\n\n"
  end

end

