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
    @text.draw("Score: HI Die = #{@message}", 10, 150, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @cursor.draw self.mouse_x, self.mouse_y, 0, 0.1, 0.1
    draw_rect(600, 1, 100, 100, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
    @m.draw
  end

  def button_down(id)
    @message = "YES"
    if mouse_y < 150
      case mouse_x
      when (0..100)
        @m.one.clicked # change die to own if it should change? (no if statement here)
      when (100..200)
        @m.two.clicked  
      when (200..300)
        @m.three.clicked 
      when (300..400)
        @m.four.clicked 
      when (400..500)
        @m.five.clicked 
      when (500..600)
        @m.six.clicked
      when (600..700)
        @m.roll_clicked
      end
    end
  end
end