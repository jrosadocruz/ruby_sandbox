
class Restaurant
  @@filepath = nil

  attr_accessor :name, :cuisine, :price

  def initialize(args={})
    @name    = args[:name]
    @cuisine = args[:cuisine]
    @price   = args[:price]
  end

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def self.file_exists?
    @@filepath && File.exists?(@@filepath)
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.writable?(@@filepath)
    return false unless File.readable?(@@filepath)
    return true
  end

  def self.create_file
    File.open(@@filepath, 'w') unless file_exists?
    file_usable?
  end

  def self.get_restaurants
    restaurants = []
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        restaurants << Restaurant.new.import_from_line(line.chomp)
      end
      file.close
    end
    # p restaurants
    restaurants
  end

  def import_from_line(line=[])
    line_array = line.split("\t")
    @name, @cuisine, @price = line_array
    self
  end

  def self.build_from_questions
    args = {}
    print "Restaurant name: "
    args[:name] = gets.chomp.strip

    print "Cuising type: "
    args[:cuisine] = gets.chomp.strip

    print "Average price: "
    args[:price] = gets.chomp.strip

    return self.new(args)
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |line|
      line.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end

end