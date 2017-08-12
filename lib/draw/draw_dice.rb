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
    @cursor = Gosu::Image.new("./media/MousePntr.png")
    @message = "NO"
  end

  def update
  end

  def draw
    draw_rect(0, 0, 1800, 1200, Gosu::Color.argb(0xff_ffffff))
    
    roll1
  end

  def roll1
    scale = 0.2
    @one.image.draw(1,     @one.selected   ? 50 : 1, 0, scale, scale )
    @two.image.draw(100,   @two.selected   ? 50 : 1, 0, scale, scale )
    @three.image.draw(200, @three.selected ? 50 : 1, 0, scale, scale )
    @four.image.draw(300,  @four.selected  ? 50 : 1, 0, scale, scale )
    @five.image.draw(400,  @five.selected  ? 50 : 1, 0, scale, scale )
    @six.image.draw(500,   @six.selected   ? 50 : 1, 0, scale, scale ) 
    @text.draw("Score: HI Die = #{@message}", 10, 150, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @cursor.draw self.mouse_x, self.mouse_y, 0, 0.1, 0.1
    draw_rect(600, 1, 100, 100, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
  end

  def button_down(id)
    @message = "YES"
    if mouse_y < 150
      case mouse_x
      when (0..100)
        @one.selected = !@one.selected if !one.locked
      when (100..200)
        @two.selected = !@two.selected if !@two.locked
      when (200..300)
        @three.selected = !@three.selected if !@three.locked
      when (300..400)
        @four.selected = !@four.selected if !@four.locked
      when (400..500)
        @five.selected = !@five.selected if !@five.locked
      when (500..600)
        @six.selected = !@six.selected if !@six.locked
      when (600..700)
        @one.selected   ? @one.locked   = true : @one.roll  
        @two.selected   ? @two.locked   = true : @two.roll  
        @three.selected ? @three.locked = true : @three.roll
        @four.selected  ? @four.locked  = true : @four.roll 
        @five.selected  ? @five.locked  = true : @five.roll 
        @six.selected   ? @six.locked   = true : @six.roll  
      end
    end
    
  end
end