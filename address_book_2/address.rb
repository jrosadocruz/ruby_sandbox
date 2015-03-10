class Address
  attr_accessor :kind, :street_1, :street_2, :city, :state, :postal_code

  def to_s(format = "short")
    case format
    when "long"
      address  = @street_1 + "\n"
      address += @street_2 + "\n" unless @street_2.nil? || @street_2.empty?
      address += @city + ", " + @state + ", " + @postal_code
    when "short"
      address  = @kind + ": "
      address += @street_1
      address += " " + @street_2 unless @street_2.nil? || @street_2.empty?
      address += " " + @city + ", " + @state + ", " + @postal_code
    end

  end

end

