class Missile

  attr_accessor :muzzle_location, :y, :velocity

  def initialize(muzzle_location,velocity)
    @location = :muzzle_location
    @velocity = :velocity
  end

  # def launch(velocity)
  #   @velocity = velocity
  # end

  def move
    self.location.y += velocity
  end

  def draw
    puts self
  end

  def to_s
    "#{falling? ? '☄️' : '🚀'} (#{x}, #{y})"
  end

  def falling?
    velocity > 0
  end

end
