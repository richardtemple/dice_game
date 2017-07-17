require "./lib/selection_rules/selection_rule.rb"

class Game

  attr_accessor :current_dice

  def initialize
    @current_dice = []
  end
 
  def start
    puts "Welcome to the game!"
    roll_dice
    select_dice
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
end