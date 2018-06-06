require "./lib/selection_rules/selection_rule.rb"
require "./lib/hand_score.rb"
require "./lib/draw/die.rb"
require "./lib/rule_error.rb"

class Main

  attr_accessor :current_dice, :one, :two, :three, :four, :five, :six, :current_hand_score, :player_one_score, :player_two_score, :current_player, :opponent

  def initialize
    @current_player = 1
    @current_dice     = []
    @selected_dice    = []
    @game_over        = false
    @current_hand_score = 0
    @player_one_score = 0
    @player_two_score = 0
    reset_die
  end
 
  def play_computer_hand
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
    puts "Computer Player Score: #{@player_two_score}"
  end

  def draw
    scale = 0.2
    @one.image.draw(1,     @one.selected   ? 50 : 1, 0, scale, scale )
    @two.image.draw(100,   @two.selected   ? 50 : 1, 0, scale, scale )
    @three.image.draw(200, @three.selected ? 50 : 1, 0, scale, scale )
    @four.image.draw(300,  @four.selected  ? 50 : 1, 0, scale, scale )
    @five.image.draw(400,  @five.selected  ? 50 : 1, 0, scale, scale )
    @six.image.draw(500,   @six.selected   ? 50 : 1, 0, scale, scale ) 
  end

  def roll_clicked
    unless (dice.any? { |die| die.selected && !die.locked })
      return
    end

    dice.each { |die| die.lock if die.selected }
    if !current_selection_valid?
      dice.each do |die|
        if (die.selected && die.new_lock?)
          die.reset
        end
      end
      return
    end

    dice.each { |die| die.roll if !die.selected }

    @current_hand_score += HandScore.new.score_sets(sets: current_selection)

    if (dice.all? { |die| die.selected})
      dice.each { |die| die.reset; die.roll}
    end
  end

  def end_turn_clicked
    @one.lock   if @one.selected
    @two.lock   if  @two.selected  
    @three.lock if @three.selected
    @four.lock  if @four.selected
    @five.lock  if @five.selected
    @six.lock   if @six.selected

    if current_selection_valid?
      @current_hand_score += HandScore.new.score_sets(sets: current_selection)
    else
      @current_hand_score = 0
    end
    hand_over
  end

  def dice
    [] << @one << @two << @three << @four << @five << @six
  end

  def current_selection
    selection = dice.select { |die| die.new_lock? }
    if selection.count > 0
      [] << selection.map { |die| die.value }
    else
      []
    end
  end

  def current_selection_valid?
    begin
      HandScore.new.score_sets(sets: current_selection) > 0
    rescue RuleError => e
      false
    end
  end

  def hand_over
    if @current_player == 1
      @player_one_score += @current_hand_score
      @current_hand_score = 0
      reset_die
      if opponent_is_computer?
        play_computer_hand
      else
        @current_player = 2
      end
    else
      @player_two_score += @current_hand_score
      @current_hand_score = 0
      reset_die
      @current_player = 1
    end
  end

  def reset_die
    @one, @two, @three, @four, @five, @six = Die.new, Die.new, Die.new, Die.new, Die.new, Die.new
  end


  def select_dice
    z = SelectionRule.new 
    z.select_dice(dice: @current_dice.dup)
  end

  def score_sets
    new_score = HandScore.new.score_sets(sets: @selected_dice)
    puts "Total Score: #{new_score}"
    @player_two_score += new_score
    if @player_two_score >= 10000
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
  end

  def opponent_is_computer?
    @opponent.downcase == "c"
  end
end
