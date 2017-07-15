class Game

  attr_accessor :current_dice

  def initialize
    @current_dice = []
  end

  def start
    puts "Welcome to the game!"
    roll_dice
    current_dice.each do |die|
      print die.to_s + ", "
    end
  end

  def read_user_input
    gets.chomp
  end

  def roll_dice
    5.times do |counter|
      @current_dice[counter] = rand(6) + 1
    end
  end
end