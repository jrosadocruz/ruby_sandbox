require './item'

class String
  def is_number?
    true if Float(self) rescue false
  end
end

class ShoppingList
  attr_writer :lists

  def initialize
    @lists = []
  end

  def run!
    puts "\n--------- Bienvenido a la Lista de Compras. ---------\n\n"
    print_menu
    # create_list
  end

  def print_menu
    puts "Do you wish to load a previous list or create a new list?"
    puts "L: load list"
    puts "C: create a new list"
    print "> "
    user_input = gets.chomp.strip
    puts "\n"

    case user_input
    when "l"
      load_list
    when "c"
      create_list
    end
  end

  def load_list
    puts "Lists loaded"
    read_lists
    puts "\n"
  end

  def create_list
    list = List.new
    print "List name: "
    list.name = gets.chomp.strip

    add_items_to_list(list)

    @lists << list
  end

  def add_items_to_list(list)
    user_input = nil
    puts "Do you wish to add items to your List «#{list.name}»? y/n "
    print "> "
    user_input = gets.chomp.strip
    while user_input != "n"
      list.add_items()
      print "Add a new item? y/n? "
      user_input = gets.chomp.strip
      puts "\n"
    end
  end

  def print_lists
    @lists.each do |list|
      puts "\n"
      print_separator
      puts list.name
      print_separator

      if list.items.length > 0
        list.items.each do |item|
          puts "Item: #{item.name} \t\tQuantity: #{item.quantity}"
        end
        puts "\n"
      else
        puts "***There are no items in your list***\n\n\n"
      end
    end
  end

end

class List
  attr_accessor :name
  attr_reader :items

  def initialize
    @items = []
  end

  def add_items
    item     = Item.new
    user_name_input = nil

    print "Item name: "
    user_name_input = gets.chomp.strip

    while test_item(user_name_input)
      puts "Item name cannot be blank. Please enter item name."
      print "Item name: "
      user_name_input = gets.chomp.strip
    end

    item.name = user_name_input


    # item.quantity = input

    @items << item
  end

  def test_item(item=nil)
    return false if item.nil?

    if item.class == Fixnum || item.to_s.is_number?
      return "Item is 0" if item == 0
      return true
    end

    if item.class == String
      return "String is empty" if item.strip.empty?
      return true
    end
  end

end



class Item
  attr_accessor :name, :quantity
end


def print_separator(char="-")
  puts char * 80
end


list = ShoppingList.new
list.run!

list.print_lists