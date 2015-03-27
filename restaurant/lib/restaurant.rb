class Restaurant
  @@filepath = nil

  attr_accessor :name, :cuisine, :price

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
    # Create file if file doesn't exists
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
  end

  def self.saved_restaurant

  end

  def self.build_from_questions
    args = {}
    print "Restaurant name: "
    args[:name]    = gets.chomp.strip

    print "Cuisine type: "
    args[:cuisine] = gets.chomp.strip

    print "Avg. price: "
    args[:price]   = gets.chomp.strip

    return self.new(args)
  end

  def initialize(args={})
    @name    = args[:name]
    @cuisine = args[:cuisine]
    @price   = args[:price]
  end

  def save
    # Add Restaurant class, as `file_usable?` is a class method.
    return false unless Restaurant.file_usable?

    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end


end