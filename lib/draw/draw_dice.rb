require 'rubygems' 
require 'gosu'
require_relative '../../main'

include Gosu

class DrawDice < Gosu::Window

  def initialize
    super(1800, 1200)
    self.caption = "Dice"
    @m = Main.new
    @text   = Gosu::Font.new(20)
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
    @m.roll1
    @text.draw("Score: HI Die = #{@message}", 10, 150, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @cursor.draw self.mouse_x, self.mouse_y, 0, 0.1, 0.1
    draw_rect(600, 1, 100, 100, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
  end

  def button_down(id)
    @message = "YES"
    if mouse_y < 150
      case mouse_x
      when (0..100)
        @m.one.selected   = !@m.one.selected   unless @m.one.locked # change die to own if it should change? (no if statement here)
      when (100..200)
        @m.two.selected   = !@m.two.selected   unless @m.two.locked
      when (200..300)
        @m.three.selected = !@m.three.selected unless @m.three.locked
      when (300..400)
        @m.four.selected  = !@m.four.selected  unless @m.four.locked
      when (400..500)
        @m.five.selected  = !@m.five.selected  unless @m.five.locked
      when (500..600)
        @m.six.selected   = !@m.six.selected   unless @m.six.locked
      when (600..700)
        @m.one.selected   ? @m.one.locked   = true : @m.one.roll  
        @m.two.selected   ? @m.two.locked   = true : @m.two.roll  
        @m.three.selected ? @m.three.locked = true : @m.three.roll
        @m.four.selected  ? @m.four.locked  = true : @m.four.roll 
        @m.five.selected  ? @m.five.locked  = true : @m.five.roll 
        @m.six.selected   ? @m.six.locked   = true : @m.six.roll  
      end
    end
  end
end