require 'restaurant'

class Guide
  @@filepath = nil
  @@actions = ['list','add','find','quit']

  def initialize(path=nil)
    Restaurant.filepath = path

    if Restaurant.file_usable?
      puts "Restaurant file loaded"
    elsif Restaurant.create_file
      puts "Restaurant file created"
    else
      puts "Exiting"
      exit!
    end
  end

  def launch!
    introduction
    retrieve_actions
    conclusion
  end

  def retrieve_actions
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
  end

  def get_action
    action = nil
    until @@actions.include?(action)
      puts "Actions: " + @@actions.join(", ") if action
      print "> "
      user_input = gets.chomp
      action = user_input.downcase.strip
    end
    action
  end

  def do_action(action)
    case action
    when 'list'
      list
    when 'add'
      add
    when 'find'
      find
    when 'quit'
      return :quit
    else
      puts "I don't know this command"
    end
  end

  def list
    puts "Listing restaurants"
    restaurants = Restaurant.get_restaurants
    p restaurants
    print_restaurants(restaurants)
  end

  def print_restaurants(restaurants=[])
    restaurants.each do |rest|
      puts "#{rest.name}\t#{rest.cuisine}\t#{rest.price}"
    end
  end

  def add
    puts "\nAdding a new Restaurant\n"
    restaurant = Restaurant.build_from_questions
    if restaurant.save
      puts "Restaurant has been added"
    else
      puts "Save error: restaurant could not be saved"
    end
  end

  def find
    puts "Find"
  end

  def introduction
    puts "<<< Welcome to the Restaurant Searcher >>>".center(60)
    puts "an interactive guide to eating in great places".center(60)
  end

  def conclusion
    puts "\n\n"
    puts "Bye, bye. Have a good one!".center(60)
  end

end