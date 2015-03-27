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

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, "a") do |file|
      file.puts "#{[@name,@cuisine,@price].join("\t")}\n"
    end
    return true
  end

end