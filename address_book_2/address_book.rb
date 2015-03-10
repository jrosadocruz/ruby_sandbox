require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def run!
    puts "Address Book"
    puts "A: add contact"
    puts "S: ser"
  end

  def add_contact
    # contact = Contact.new
    # contact.first_name = gets.chomp
  end

  def print_contacts
    @contacts.each do |contact|
      puts contact.full_name
      contact.phone_numbers.each do |number|
        puts number
      end
      contact.addresses.each do |address|
        puts address
      end
      puts "\n"
    end
  end
end

address_book = AddressBook.new
address_book.run!

jose = Contact.new
jose.first_name = "José"
jose.middle_name = "Ricardo"
jose.last_name = "Rosado"
jose.add_phone_number("Home", "809-555-5555")
jose.add_phone_number("Work", "829-333-3333")
jose.add_address("Home", "123 Home St", "Calle Emilio", "Santo Domingo", "D.N.", "00000")
jose.add_address("Work", "123 Work St", "Calle Work", "Santiago", "Santiago de los Caballeros", "11111")

brenda = Contact.new
brenda.first_name = "Brenda"
brenda.last_name = "Taveras"
brenda.add_phone_number("Home", "809-444-4444")
brenda.add_phone_number("Work", "829-777-7777")
brenda.add_address("Home", "456 Brenda St", "Calle Taveras", "Santo Domingo", "D.N.", "00000")

address_book.contacts << jose
address_book.contacts << brenda

address_book.print_contacts