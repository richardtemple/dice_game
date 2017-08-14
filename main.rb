require "./lib/selection_rules/selection_rule.rb"
require "./lib/hand_score.rb"
require "./lib/draw/draw_dice.rb"
require "./lib/draw/die.rb"

class Main

  attr_accessor :current_dice, :one, :two, :three, :four, :five, :six

  def initialize
    @current_dice     = []
    @selected_dice    = []
    @game_over        = false
    @player_one_score = 0
    @player_two_score = 0
    @one, @two, @three, @four, @five, @six = Die.new, Die.new, Die.new, Die.new, Die.new, Die.new
  end
 
  # def start
  # 	# require 'pry'; binding.pry;
  #   # x = DrawDice.new.show
  #   # x.draw

  #   puts "Welcome to the game!"
  #   while !@game_over
  #     while re_roll? do
  #       roll_dice(@current_dice.count)
  #       new_selection = select_dice
  #       if (new_selection.count > 0)
  #         @selected_dice += new_selection
  #       else
  #         puts "oops! nothing to select!!"
  #         @selected_dice = []
  #         break
  #       end
  #       @current_dice = @current_dice - @selected_dice.flatten
  #       puts "New Current dice #{current_dice}"
  #       puts "Selected dice: #{@selected_dice.to_s}"
  #     end
  #     score_sets
  #     @current_dice = []
  #     @selected_dice = []
  #   end
  #   puts "Player One Score: #{@player_one_score}"
  # end

  def draw
    scale = 0.2
    @one.image.draw(1,     @one.selected   ? 50 : 1, 0, scale, scale )
    @two.image.draw(100,   @two.selected   ? 50 : 1, 0, scale, scale )
    @three.image.draw(200, @three.selected ? 50 : 1, 0, scale, scale )
    @four.image.draw(300,  @four.selected  ? 50 : 1, 0, scale, scale )
    @five.image.draw(400,  @five.selected  ? 50 : 1, 0, scale, scale )
    @six.image.draw(500,   @six.selected   ? 50 : 1, 0, scale, scale ) 
  end

  def read_user_input
    gets.chomp
  end

  def roll_dice(die_count = 6)
    die_count = 6 if die_count == 0
    die_count.times do |counter|
      @current_dice[counter] = rand(6) + 1
      print @current_dice[counter].to_s
      print ", " unless counter == die_count - 1
    end
    puts
  end

  def roll_clicked
    # Collect the newly selected die
    # Does the newly selected dice make a legal selection?
    #   if not, end turn
    #  if so, commit selection


    @one.selected   ? @one.locked   = true : @one.roll  
    @two.selected   ? @two.locked   = true : @two.roll  
    @three.selected ? @three.locked = true : @three.roll
    @four.selected  ? @four.locked  = true : @four.roll 
    @five.selected  ? @five.locked  = true : @five.roll 
    @six.selected   ? @six.locked   = true : @six.roll  

    # update current hand score.
    
  end
  def select_dice
    z = SelectionRule.new 
    z.select_dice(dice: @current_dice.dup)
  end

  def score_sets
    new_score = HandScore.new.score_sets(sets: @selected_dice)
  	puts "Total Score: #{new_score}"
    @player_one_score += new_score
    if @player_one_score >= 10000
      @game_over = true
    end
  end
  
  def re_roll?
    puts "count: #{@current_dice.count}"
    if @current_dice.count > 3 || @current_dice.count == 0
      puts "Roll!"
      return true
    else
      puts "No Reroll!"
      return false
    end
  end
end