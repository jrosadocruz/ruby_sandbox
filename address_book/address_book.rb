require './helpers.rb'
require './contact.rb'

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def add_contact
    
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

    print_results("Search result for (#{name})", results)
  end

  def find_by_phone(phone_number)
    results = []
    search  = phone_number.gsub(/[-.]/, '')
    i = 0
    @contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub(/[-.]/, '').include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end

    print_results("Search result for (#{phone_number})", results)
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
# address_book.contacts.push(brenda)

# puts jose.to_s('full_name')
# jose.print_phone_numbers
# jose.print_addresses

# address_book.print_contacts
address_book.find_by_name('a')
# address_book.find_by_phone('8')
