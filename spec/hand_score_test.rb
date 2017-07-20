require "minitest/autorun"
require "minitest/spec"
require_relative "../lib/hand_score.rb"

describe HandScore do 
  let(:hand_score) { HandScore.new }

  describe "scores with less than 7 die" do
    it "should return 100" do
      score = hand_score.score_sets(sets: [[1]])
      assert_equal score, 100
    end
  end
end