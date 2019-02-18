require_relative 'alien'
require_relative 'ship'
require_relative 'missile_collection'

class GalagaInvaders

  WIDTH = 1920
  HEIGHT = 1080

  attr_accessor :ship, :alien, :missiles

  def initialize
    @caption = "Galaga Invaders"
    @ship = Ship.new(WIDTH, HEIGHT)
    @alien = Alien.new
    @missiles = MissileCollection.new
  end

  def update
    missiles.update
  end

  def draw
    ship.draw
    alien.draw
    missiles.draw
  end

  def show
    while (true) do
      update
      draw
      key_pressed(gets.chomp) # Simulating a key interrupt.
    end
  end

  def key_pressed(key)
    if key == 'a'
      ship.move_left
    elsif key == 'd'
      ship.move_right
    elsif key == ' '
      missiles.fire(ship)
    end
    if key == 'p'
      missiles.fire(alien)
    end
  end

end

GalagaInvaders.new.show

=begin
Reflecting on Principle
-----------------------
1. True or False: Good OO design eliminates dependencies.
Answer: False, it reduces dependencies, or make dependencies less of a risk.

2. Briefly list four ways in which a class that collaborates with another class
   is dependent on it. (For example, one dependency is knowing the other class name.)
Answer: 
1a. when a class knows The name of another class. - if it knows the name of anther class it expects a class of that neame to exist. 
2a.when a class knows  the name of a message that it intends to send to someone other than self. the class expects an instance to respond to what it is using in that class.
3a.when a class knows  the arguments that a message requires. the class knows that class.new requires stuff that it is using.
4a. when a class knows the order of those arguments. the class knows the first argument to class.new should be something, the second, something else.”

3. What are two primary factors to consider when assessing the risk of a dependency?
Answer:
1a.likelhood of the requirments chage.
2a.how volitile is the dependency 
4. What is Metz's rule of thumb for choosing a dependency direction?
Answer: “Make classes that depend on things that change less often than they do.”
=end
