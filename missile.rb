class Missile < Structure

  include Draw

  def initialize(args)
    super
    @sprite = args.fetch[:sprite]
  end

  draw(sprite)
    # Draws the `sprite` at `location`
  

end
