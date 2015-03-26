require 'restaurant'

class Guide

  @@actions = ['listar', 'buscar', 'agregar', 'salir']

  def initialize(path=nil)
    Restaurant.filepath = path

    if Restaurant.file_usable?
      puts "Se encontró el archivo de restaurantes."
    elsif Restaurant.create_file
      puts "Se creó el archivo de restaurantes."
    else
      puts "Saliendo del sistema..."
      exit!
    end
  end

  def launch!
    introduction
    result = nil

    until result == :quit
      action = get_action
      result = do_action(action)
    end

    conclusion
  end

  def get_action
    action = nil
    until @@actions.include?(action)
      puts "Acciones: " + @@actions.join(', ') if action
      print "> "
      user_input = gets.chomp
      action = user_input.downcase.strip
    end
    action
  end

  def do_action(action)
    case action
    when 'listar'
      puts "Listando..."
    when 'buscar'
      puts "Buscando"
    when 'agregar'
      puts "Saliendo"
    when 'salir'
      return :quit
    else
      puts "No conozco esa acción"
    end
  end


  def introduction
    puts "\n\n <<< Bienvenido al Buscador de Restaurantes >>>"
    puts  "Tu guía interactiva de restaurantes."
  end

  def conclusion
    puts "\n\n <<< Adiós y buen provecho>>> \n\n"
  end

end