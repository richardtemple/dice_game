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
    # case mouse_x
    # when (5..1200) 
    #   if button_down?(Gosu::MsLeft) # && @button_down = false
    #     # @button_down = true
    #     # if mouse_y < 150
    #     #   case @x
    #     #   when (0..100)
    #     #     @one.selected = !@one.selected
    #     #     # selected = 1
    #     #   when (100..200)
    #     #     @two.selected = !@two.selected
    #     #     # selected = 2
    #     #   when (200..300)
    #     #     @three.selected = !@three.selected
    #     #     # selected = 3
    #     #   when (300..400)
    #     #     @four.selected = !@four.selected
    #     #     # selected = 4
    #     #   when (400..500)
    #     #     @five.selected = !@five.selected
    #     #     # selected = 5
    #     #   when (500..600)
    #     #     @six.selected = !@six.selected
    #     #     # selected = 6
    #     #   end
    #     # end

    #     # @one.roll if !@one.selected 
    #     # @two.roll if !@two.selected 
    #     # @three.roll if !@three.selected 
    #     # @four.roll if !@four.selected 
    #     # @five.roll if !@five.selected 
    #     # # @six.roll if !@six.selected 
    #     # @x = mouse_x
    #     # @y = mouse_y
        
    #   # else
    #     # @button_down = false
    #   end
    # end
    #other instructions that works well
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
  end

  def button_down(id)
    @message = "YES"
    if mouse_y < 150
      case mouse_x
      when (0..100)
        @one.selected = !@one.selected
      when (100..200)
        @two.selected = !@two.selected
      when (200..300)
        @three.selected = !@three.selected
      when (300..400)
        @four.selected = !@four.selected
      when (400..500)
        @five.selected = !@five.selected
      when (500..600)
        @six.selected = !@six.selected
      when (600..700)
        @one.roll if !@one.selected 
        @two.roll if !@two.selected 
        @three.roll if !@three.selected 
        @four.roll if !@four.selected 
        @five.roll if !@five.selected 
        @six.roll if !@six.selected 
      end
    end
    
  end
end