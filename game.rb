require "./lib/selection_rules/selection_rule.rb"
require "./lib/hand_score.rb"
require "./lib/draw/draw_dice.rb"

class Game

  attr_accessor :current_dice

  def initialize
    @current_dice     = []
    @selected_dice    = []
    @game_over        = false
    @player_one_score = 0
    @player_two_score = 0
    @current_player_num = 1
  end
 
  def start
    x = DrawDice.new.show
    # x.draw

    puts "Welcome to the game!"
    while !@game_over
      while re_roll? do
        roll_dice(@current_dice.count)
        new_selection = select_dice
        if (new_selection.count > 0)
          @selected_dice += new_selection
        else
          puts "oops! nothing to select!!"
          @selected_dice = []
          break
        end
        @current_dice = @current_dice - @selected_dice.flatten
        puts "New Current dice #{current_dice}"
        puts "Selected dice: #{@selected_dice.to_s}"
      end
      score_sets
      @current_dice = []
      @selected_dice = []
    end
    puts "Player One Score: #{@player_one_score}"
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