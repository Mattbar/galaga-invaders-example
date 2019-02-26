#!/usr/bin/env ruby

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
      missiles.create_missile(ship.muzzle_location, ship.missile_velocity)
    end
    if key == 'p'
      missiles.create_missile(alien.muzzle_location, alien.missile_velocity)
    end
  end

end

GalagaInvaders.new.show

=begin
Reflecting on Principle
-----------------------
1. What is "duck typing" and what does it have to do with polymorphism?
  ANSWER: duck types are public interfaces that are not tied to any specific class. duck typing is one way of obtainig polymorphism. 
2. What are some common code smells that indicate the need for relying on a
   "duck type" rather than a concrete class?
   ANSWER: 1. Case statements that switch on class. 2. kind_of and is_a
3. True or False: Abstractions like duck typing make code explicitly easier to
   understand, vs. using concrete types.
   ANSWER: True.
=end
