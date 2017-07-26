require 'rubygems' 
require 'gosu'
include Gosu

class DrawDice < Gosu::Window

  def initialize
    super(1800, 1200)
    self.caption = "Dice"
    
    @one   = Die.new
    @two   = Die.new
    @three = Die.new
    @four  = Die.new
    @five  = Die.new
    @six   = Die.new
    @text =  Gosu::Font.new(20)
@cursor = Gosu::Image.new(self, Die.new.image)
  end

  def update
    case mouse_x
    when (5..1200) 
      if button_down?(Gosu::MsLeft)
        @one.roll
        @two.roll
        @three.roll
        @four.roll
        @five.roll
        @six.roll
        @x = mouse_x
        @y = mouse_y
        
      end
    end
    #other instructions that works well
  end

  def draw
    draw_rect(0, 0, 1800, 1200, Gosu::Color.argb(0xff_ffffff))
    
    roll1
  end

  def draw_random
    # if rand(2) == 1
    #   roll1
    # else
    #   roll2
    # end
    # sleep(1)
  end

  def roll1
    selected = 0
    case @x
    when (0..100)
      selected = 1
    when (100..200)
      selected = 2
    when (200..300)
      selected = 3
    when (300..400)
      selected = 4
    when (400..500)
      selected = 5
    when (500..600)
      selected = 6
    end
    scale = 0.2
    @one.image.draw(1, 1, 1, scale, scale )
    @two.image.draw(100, 1, 1, scale, scale )
    @three.image.draw(200, 1, 1, scale, scale )
    @four.image.draw(300, 1, 1, scale, scale )
    @five.image.draw(400, 1, 1, scale, scale )
    @six.image.draw(500, 1, 1, scale, scale ) 
    @text.draw("Score: HI Die = #{selected.to_s}", 10, 150, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @cursor.draw self.mouse_x, self.mouse_y, 0
  end

  def roll2
    scale = 0.2
    @one.image.draw(100, 1, 1, scale, scale )
    @two.image.draw(1, 50, 1, scale, scale )
    @three.image.draw(300, 1, 1, scale, scale )
    @four.image.draw(200, 50, 1, scale, scale )
    @five.image.draw(500, 1, 1, scale, scale )
    @six.image.draw(400, 50, 1, scale, scale )    
  end
end