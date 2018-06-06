require 'minitest/autorun'
require_relative '../main'
require "minitest/spec"
require 'gosu'

describe HandScore do 
  let(:main) { Main.new }

  describe "play_computer_hand should update player_two_score" do
    it "should be greater after 5 turns" do
      old_score = main.player_two_score
      main.play_computer_hand
      main.play_computer_hand
      main.play_computer_hand
      main.play_computer_hand
      main.play_computer_hand
      assert old_score < main.player_two_score
    end
  end

  describe "re_roll should determine if computer should try to roll again" do
    it "reroll? should be true" do
      main.one.value = 1
      main.two.value = 2
      main.three.value = 3
      main.four.value = 4
      main.five.value = 5
      main.six.value = 6
      main.select_dice
      assert main.re_roll? == true
    end
  end
end
