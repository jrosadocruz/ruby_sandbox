class Restaurant
  attr_accessor :name, :cuisine, :price
  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def self.file_exists?
    @@filepath && File.exists?(@@filepath)
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  def self.create_file
    File.open(@@filepath, 'w') unless file_exists?
    file_usable?
  end

  def self.saved_restaurants
    restaurants = []
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        restaurants << Restaurant.new.import_line(line.chomp)
      end
    end
    restaurants
  end

  def import_line(line)
    restaurant = line.split("\t")
    @name, @cuisine, @price = restaurant
    self
  end

  def self.build_from_questions
    args = {}
    print "Restaurant name: "
    args[:name]    = gets.chomp.strip
    print "Cuisine type: "
    args[:cuisine] = gets.chomp.strip
    print "Average prince: "
    args[:price]   = gets.chomp.strip

    restaurant = self.new(args)
  end

  def initialize(args={})
    @name    = args[:name]
    @cuisine = args[:cuisine]
    @price   = args[:price]
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, "a") do |file|
      file.puts "#{[@name,@cuisine,@price].join("\t")}\n"
    end
    return true
  end

end