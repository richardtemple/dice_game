require 'rubygems' 
require 'gosu'
require_relative '../../main'

include Gosu

class DrawDice < Gosu::Window

  def initialize
    puts "Welcome to the game!"
    puts "do you want to play against the computer or another human? (c/h)"
    opponent = gets.chomp
    super(1000, 500)
    self.caption = "Dice"
    @m = Main.new
    @m.opponent = opponent
    @text   = Gosu::Font.new(20)
    @cursor = Gosu::Image.new("./media/MousePntr.png")
    @current_player_msg = Gosu::Font.new(20)
    @roll_button_label = Gosu::Font.new(20)
    @end_button_label = Gosu::Font.new(20)
    @player1_label = Gosu::Font.new(20)
    @player2_label = Gosu::Font.new(20)
    @status_label = Gosu::Font.new(20)
  end

  def draw
    draw_rect(0, 0, 1000, 500, Gosu::Color.argb(0xff_ffffff))
    @cursor.draw self.mouse_x, self.mouse_y, 10, 0.1, 0.1
    draw_rect(600, 1, 100, 100, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
    @roll_button_label.draw("ROLL!", 615, 40, 1, 1.0, 1.0, Gosu::Color::WHITE)
    draw_rect(600, 200, 100, 100, Gosu::Color.argb(0xff_000000), z = 0, mode = :default)
    @end_button_label.draw("END!", 615, 240, 1, 1.0, 1.0, Gosu::Color::WHITE)
    @current_player_msg.draw("Player #{@m.current_player} current hand = #{@m.current_hand_score}", 10, 150, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @player1_label.draw("Player 1 Score: #{@m.player_one_score}", 10, 200, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @player2_label.draw("Player 2 Score: #{@m.player_two_score}", 10, 250, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @status_label.draw("#{@status_label_text}", 10, 300, 1, 1.0, 1.0, Gosu::Color::BLACK)
    @m.draw
  end

  def button_down(id)
    return unless id == 256  # left click only
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
    # end turn button
    if ((151..300) === mouse_y && (600..700) === mouse_x)
      @m.end_turn_clicked
    end
  end
end