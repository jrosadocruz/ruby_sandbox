def spanish_number number

  return puts "Cero" if number == 0
  return puts "Cien" if number == 100
  return puts "Por favor, utilice un número mayor que 0" if number < 0

  result = ''
  child = %w{uno dos tres cuatro cinco seis siete ocho nueve}
  teens = %w{once doce trece catorce quince diesiseis diesisiete diesiocho diesinueve}
  tens = %w{diez veinti trenti cuarenta cincuenta sesenta setenta ochenta noventa}
  # hundreds = %{cien doscientos trescientos cuatrocientos quinientos sesientos setesientos ochocientos nuevecientos}

  memo  = number
  write = memo / 100
  memo  = memo - (write * 100)
  # puts "memo: #{memo}"
  # puts "write: #{write}"

  if write > 0
    # puts "memo100: #{memo}"
    # puts "write100: #{write}"

    cientos = spanish_number write
    result += "#{cientos}" + "cientos" unless write == 1
    result += "ciento" if write == 1

    if memo > 0
      result += " "
    end

  end


  memo  = number
  write = memo / 10 # => 20 / 10 = 2
  memo  = memo - (write * 10)
  puts "memo: #{memo}"
  puts "write: #{write}"

  if write > 0
    if write == 1 &&  memo > 0
      # puts "memo: #{memo}"
      # puts "write: #{write}"
      result += teens[memo-1].to_s
      memo = 0
    else
      # puts "memo: #{memo}"
      # puts "write: #{write}"
      result += tens[write-1].to_s
    end
  end

  write = memo
  memo = 0

  if write > 0
    # puts "memo: #{memo}"
    # puts "write: #{write}"
    result += child[write-1]
  end

  # puts result

end


# spanish_number(1)
# spanish_number(2)
# spanish_number(3)
# spanish_number(4)
# spanish_number(5)
# spanish_number(6)
# spanish_number(7)
# spanish_number(8)
# spanish_number(9)
# spanish_number(10)
# spanish_number(11)
# spanish_number(12)
# spanish_number(13)
# spanish_number(14)
# spanish_number(15)
# spanish_number(16)
# spanish_number(17)
# spanish_number(18)
# spanish_number(19)
# spanish_number(20)
# spanish_number(21)
# spanish_number(22)
# spanish_number(30)
# spanish_number(31)
# spanish_number(41)
# spanish_number(51)
# spanish_number(61)
# spanish_number(71)
# spanish_number(81)
# spanish_number(91)
# spanish_number(100)
# puts spanish_number(101)
puts spanish_number(158)
# puts spanish_number(201)
