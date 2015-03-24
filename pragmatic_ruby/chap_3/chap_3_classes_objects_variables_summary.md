# Classes, Objects, and Variables
En sistemas OO, siempre es bueno detectar las _cosas_ con las que vas a trabajar. Por lo general, convertirás cada _cosa_ en una clase y las _cosas_ en sí serán instancias de la clase.

## Classes
Toda clase debe iniciar con letra mayúscula.
```ruby
class Libro
end
```

Puedes imaginar una `class` como el patrón que dictará las características de un objeto. Por ejemplo: un libro es un objeto, es algo que existe en nuestro mundo. Todo libro tiene características distintas, no obstantes siguen siendo libros. La `class` de libro sería como el dibujo que utilizará el fabricante para fabricar muchos libros.

Para crear una nueva instancia de la `class`, se utiliza el method `.new`. Una instancia es como una copia que le haces a las `class`, pero que tiene la información que deseas.
```ruby
libro1 = Libro.new
libro2 = Libro.new
```

Cuando creas un nuevo objecto a partir de la class sin agregar ningún tipo de información, se pudieran considerar como semejantes (no iguales) ya que no poseen caracteristicas que les distinguan uno del otro y no contienen más información que el 'id' que Ruby le asigna al nuevo objeto.

Imagina lo siguiente: Dos libros, aun tengan el mismo título, tamaño, grosor, etc, son dos libros distintos, ya que ocupan un lugar distinto en el espacio. Así mismo, en Ruby, dos instancias de la clase de Libro son diferentes aunque tengan la misma información dentro, pero semejantes en información.

## Instance Variables
La mejor manera de dar vida propia a cada objeto es insetarle información. Una de las formas más comunes de hacer esto es utilizando el method `initialize`. Por lo general, utilizas este método para asignarle información a las _instance variables_. A diferencia de cualquier otro método que esté dentro de la clase, el método `initialize` corre desde que creas una nueva instancia de la clase.

```ruby
class Libro
    def initialize(isbn, precio) # esto corre de antes que todo
        @isbn = isbn
        @precio = precio.to_f
    end
end
```

Las _instance variables_ son variables únicas para cada instancia de la clase.
```ruby
libro1 = Libro.new("isbn1", "3.0") 
libro2 = Libro.new("isbn2", 4.76) 

p libro1 #=> <Libro:0x007f9b358a77a8 @isbn="isbn1", @price=3.0>
p libro2 #=> <Libro:0x007f9b358a75f0 @isbn="isbn2", @price=4.76>
```

## Access Control

#### Public
I can use this function inside and outside of the class.

```ruby
account.print_state # => You have 0 dollars. You spent it all on Bloc.io
```

#### Private
I can use this inside the class, but not outside of it. So no calling this function on the instance.

```ruby
class Account
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def transfer(account_to_transfer, amount)
     debit(amount)
     credit(account_to_transfer, amount)
  end

  def credit(account, amount)
     account.balance -= amount
  end

  def debit(amount)
    @balance += amount
  end

  public :transfer
  private :debit, :credit

end

account_a = Account.new(500)
account_b = Account.new(300)

account_a.transfer(account_b, 100)
p "Account A: #{account_a.balance}" #=> Account A: 600
p "Account b: #{account_b.balance}" #=> Account B: 200

account_a.debit(100) # this will not work => Error: private method `debit' called
```