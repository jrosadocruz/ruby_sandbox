require './helpers.rb'
require './contact.rb'

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def run
    loop do
      puts "Address Book"
      puts "A: add new contact"
      puts "S: search for contact"
      puts "E: to exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when 'a'
        add_contact
      when 's'
        print "Search term: "
        search = gets.chomp
        find_by_name(search)
        find_by_phone(search)
        find_by_address(search)
      else 'e'
        break
      end
    end
  end

  def add_contact
    contact = Contact.new
    print "First name: "
    contact.first_name = gets.chomp
    print "Middle name: "
    contact.middle_name = gets.chomp
    print "Last name: "
    contact.last_name = gets.chomp

    loop do
      puts "Add phone number or address?"
      puts "p: Add phone number"
      puts "a: Add address"
      puts "(Any other key to go back)"
      responce = gets.chomp.downcase
      case responce
      when 'p'
        phone = PhoneNumber.new
        print "Phone number kind (Home, Work, Etc): "
        phone.kind = gets.chomp
        print "Number: "
        phone.number = gets.chomp
        contact.phone_numbers << phone
      when 'a'
        address = Address.new
        print "Address kind (Home, Work, Etc): "
        address.kind = gets.chomp
        print "Address line 1: "
        address.street_1 = gets.chomp
        print "Address line 2: "
        address.street_2 = gets.chomp
        print "City: "
        address.city = gets.chomp
        print "State: "
        address.state = gets.chomp
        print "Postal code: "
        address.postal_code = gets.chomp
        contact.addresses << address
      else
        print "\n"
        break
      end
    end
    @contacts << contact
  end

  def print_contacts
    puts 'Contact List'
    @contacts.each do |contact|
      puts contact.to_s('full_name')
    end
  end

  def remove_contact
    # used to remove contacts
  end

  def edit_contact
    # used to remove contact
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    @contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end

    print_results("Name search result for (#{name})", results)
  end

  def find_by_phone(phone_number)
    results = []
    search  = phone_number.gsub(/[-.]/, '')
    @contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub(/[-.]/, '').include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end

    print_results("Phone search result for (#{phone_number})", results)
  end

  def find_by_address(address)
    results = []
    search  = address.downcase

    @contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end

    print_results("Address search result for (#{address})", results)
  end

  def print_results(msg, array)
    puts msg
    array.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

end

address_book = AddressBook.new
jose = Contact.new
jose.first_name = "José"
jose.middle_name = "Ricardo"
jose.last_name = "Rosado"
jose.add_phone_number('Home', '809-555-5555')
jose.add_phone_number('Work', '809-333-3333')
jose.add_address('Home', '123 Home St.', '', 'Santo Domingo', 'D.N.', '00000')
jose.add_address('Work', '456 Work St.', 'Esquina Bohechio', 'Santo Domingo', 'D.N.', '00000')

brenda = Contact.new
brenda.first_name = 'Brenda'
brenda.last_name = 'Taveras'
brenda.add_phone_number('Home', '829-444-4444' )
brenda.add_address('Home', 'Calle 21 no.17', '', 'Santo Domingo', 'D.N.', '00000')

address_book.contacts.push(jose)
address_book.contacts.push(brenda)
address_book.run
# address_book.contacts.push(brenda)

# puts jose.to_s('full_name')
# jose.print_phone_numbers
# jose.print_addresses

# address_book.print_contacts
# address_book.find_by_name('a')
# address_book.find_by_phone('8')
# address_book.find_by_address('Santo')
