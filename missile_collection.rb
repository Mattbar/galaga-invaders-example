class MissileCollection

  attr_reader :missiles

  def initialize
    @missiles = []
  end

  def add(missile)
    missiles << missile
  end

  def update
    missiles.each(&:move)
  end

  def draw
    missiles.each(&:draw)
  end

  def create_missile(muzzle_location, velocity)
    missile = Missile.new(muzzle_location)
    missile.launch(velocity)
    
    add(missile)
  end

end
