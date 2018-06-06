require "minitest/autorun"
require "minitest/spec"
require_relative "../lib/hand_score.rb"

describe HandScore do 
  let(:hand_score) { HandScore.new }

  describe "scores with less than 7 die using one number" do
    it "should return 100" do
      score = hand_score.score_sets(sets: [[1]])
      assert_equal score, 100
    end

    it "should return 1000" do
    	score = hand_score.score_sets(sets: [[1, 1, 1]])
      assert_equal score, 1000
    end

    it "should return 2000" do
    	score = hand_score.score_sets(sets: [[1, 1, 1, 1]])
      assert_equal score, 2000
    end

    it "should return 3000" do
    	score = hand_score.score_sets(sets: [[1, 1, 1, 1, 1]])
      assert_equal score, 3000
    end

    it "should return 4000" do
    	score = hand_score.score_sets(sets: [[1, 1, 1, 1, 1, 1]])
      assert_equal score, 4000
    end

    it "should return 100" do
      score = hand_score.score_sets(sets: [[5, 5]])
      assert_equal score, 100
    end

    it "should return 500" do
    	score = hand_score.score_sets(sets: [[5, 5, 5]])
      assert_equal score, 500
    end

    it "should return 1000" do
      score = hand_score.score_sets(sets: [[5, 5, 5, 5]])
      assert_equal score, 1000
    end

    it "should return 200" do
      score = hand_score.score_sets(sets: [[2,2,2]])
      assert_equal score, 200
    end

    it "should return 300" do
      score = hand_score.score_sets(sets: [[3,3,3]])
      assert_equal score, 300
    end

    it "should return 400" do
      score = hand_score.score_sets(sets: [[4, 4, 4]])
      assert_equal score, 400
    end

    it "should return 600" do
      score = hand_score.score_sets(sets: [[6, 6, 6]])
      assert_equal score, 600
    end

    it "should return 1200" do
      score = hand_score.score_sets(sets: [[6, 6, 6, 6]])
      assert_equal score, 1200
    end
  end

  describe "scores with less than 7 die using multiple numbers" do
    it "should return 500" do
      score = hand_score.score_sets(sets: [[4, 4, 4, 1]])
      assert_equal score, 500
    end

    it "should return 500" do
      score = hand_score.score_sets(sets: [[4, 4, 4, 5, 5]])
      assert_equal score, 500
    end

    it "should return 2000" do
      score = hand_score.score_sets(sets: [[1, 2, 4, 3, 5, 6]])
      assert_equal score, 2000
    end
  end
end