require "./lib/selection_rules/selection_rule.rb"
require "./lib/hand_score.rb"

class Game

  attr_accessor :current_dice

  def initialize
    @current_dice = []
    @selected_dice = []
  end
 
  def start
    puts "Welcome to the game!"
    roll_dice
    @selected_dice = select_dice
    @current_dice = @current_dice - @selected_dice.flatten
    puts "Current dice #{current_dice}"
    puts "Selected dice: #{@selected_dice.to_s}"
    score_sets
    while re_roll? do
      roll_dice(@current_dice.count)
      new_selection = select_dice
      if (new_selection.count > 0)
        @selected_dice += new_selection
      end
      @current_dice = @current_dice - @selected_dice.flatten
      puts "Current dice #{current_dice}"
      puts "Selected dice: #{@selected_dice.to_s}"
    end
    score_sets
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
  	puts "Total Score: #{HandScore.new.score_sets(sets: @selected_dice)}"
  end
  
  def re_roll?
    puts "count: #{@current_dice.count}"
    if @current_dice.count > 3 || @current_dice.count == 0
      puts "Reroll!"
      return true
    else
      puts "No Reroll!"
      return false
    end
  end
end