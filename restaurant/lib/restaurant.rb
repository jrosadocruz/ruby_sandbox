class Restaurant
  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def self.file_exists?
    @@filepath && File.exists?(@@filepath)
    # if @@filepath && File.exists?(@@filepath) then true else false end
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

end