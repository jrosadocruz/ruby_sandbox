class Animal
	attr_accessor :name
	attr_writer   :color
	attr_reader   :legs, :arms

  @@species = ['cat', 'dog', 'horse', 'duck']
  @@current_animals = []

  def self.all_species
    @@species  
  end 

  def self.get_current_animals
    @@current_animals
  end 

  def self.create_with_attributes(noise, color)
    animal = self.new(noise)
    animal.color = color
    return animal
  end


	def initialize(noise, legs=4, arms=0)
		@noise = noise
    @legs  = legs
		@arms  = arms
    @@current_animals << self
    puts "New animal has been instatiated"
	end

	def color
		"The color is #{@color}"
	end

	def noise=(noise)
		@noise = noise
	end

	def noise
		@noise
	end
end

puts Animal.all_species.inspect
dog = Animal.new("Woof", 4, 1 )
# dog.setup_limbs
dog.color = "black"
dog.noise = "Woof"
puts dog.noise
puts dog.legs
puts dog.arms
puts dog.color

duck = Animal.create_with_attributes("Quak", "white")
puts duck.noise
puts duck.color

puts Animal.get_current_animals.inspect








