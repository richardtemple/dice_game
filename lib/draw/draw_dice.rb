require 'rubygems' 
require 'gosu'
include Gosu

class DrawDice < Gosu::Window

  def initialize
    super(800, 600)
    self.caption = "Jump 'n Run"
    @one, @two, @three, @four = *Image.load_tiles(self, "./media/dice.png", 480, 490, true)
  end

  def update
  end

  def draw
    scale = 0.2
    @one.draw(1, 1, 1, scale, scale )
    @two.draw(100, 1, 1, scale, scale )
    @three.draw(200, 1, 1, scale, scale )
    @four.draw(300, 1, 1, scale, scale )
  end
end