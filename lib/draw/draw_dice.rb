require 'rubygems' 
require 'gosu'
include Gosu

class DrawDice < Gosu::Window

  def initialize
    super(1800, 1200)
    self.caption = "Jump 'n Run"
    
    @one   = Gosu::Image.new("./media/1.png")
    @two   = Gosu::Image.new("./media/2.png")
    @three = Gosu::Image.new("./media/3.png")
    @four  = Gosu::Image.new("./media/4.png")
    @five  = Gosu::Image.new("./media/5.png")
    @six   = Gosu::Image.new("./media/6.png")

  end

  def update
  end

  def draw
draw_rect(0, 0, 1800, 1200, Gosu::Color.argb(0xff_ffffff))
    scale = 0.2
    @one.draw(1, 1, 1, scale, scale )
    @two.draw(100, 1, 1, scale, scale )
    @three.draw(200, 1, 1, scale, scale )
    @four.draw(300, 1, 1, scale, scale )
    @five.draw(400, 1, 1, scale, scale )
    @six.draw(500, 1, 1, scale, scale )
  end
end