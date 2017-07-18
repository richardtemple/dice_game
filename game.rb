require "./lib/selection_rules/selection_rule.rb"
require "./lib/hand_score.rb"

class Game

  attr_accessor :current_dice

  def initialize
    @current_dice = []
  end
 
  def start
    puts "Welcome to the game!"
    roll_dice
    select_dice
    score_sets
  end

  def read_user_input
    gets.chomp
  end

  def roll_dice
    6.times do |counter|
      @current_dice[counter] = rand(6) + 1
      print @current_dice[counter].to_s
      print ", " unless counter == 5
    end
    puts
  end

  def select_dice
    z = SelectionRule.new 
    @selected_dice = z.select_dice(dice: @current_dice)
    puts @selected_dice.to_s
  end

  def score_sets
  	puts "Total Score: #{HandScore.new.score_sets(sets: @selected_dice)}"
  end
end