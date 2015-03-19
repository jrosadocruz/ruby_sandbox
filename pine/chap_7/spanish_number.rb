def spanish_number number

  return puts "Cero" if number == 0
  return puts "Por favor, utilice un número mayor que 0" if number < 0

  result = ''
  primarios = %w{uno dos tres cuatro cinco seis siete ocho nueve}
  adolescentes = %w{once doce trece catorce quince diesiseis diesisiete diesiocho diesinueve}
  decimas = %w{diez veinte trenti cuarenta cincuenta sesenta setenta ochenta noventa}

  memo  = number
  write = memo / 10 # => 10 / 10 = 1
  memo  = memo - (write * 10)
  # puts memo

  if write > 0
    if write == 1 && memo > 0
      result = adolescentes[memo-1]
      memo = 0
    else
      result += decimas[memo+1]
    end
  end

  write = memo
  memo  = 0

  if write > 0
    result += primarios[write-1]
  end

  puts result

end


spanish_number(1)
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
spanish_number(21)
# spanish_number(22)
# spanish_number(31)
# spanish_number(41)
# spanish_number(51)
# spanish_number(61)
