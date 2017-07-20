require "minitest/autorun"
require "minitest/spec"
require_relative "../lib/selection_rules/selection_rule.rb"

describe SelectionRule do 
  let(:rule) { SelectionRule.new }

  describe "selection should allow 1s to be individually counted" do
    it "should return [[1]]" do
      selection = rule.select_dice(dice: [1, 2, 3, 4, 4, 6])
      assert_equal selection, [[1]]
    end

    it "should return [[1, 1]]" do
      selection = rule.select_dice(dice: [1, 2, 3, 4, 1, 6])
      assert_equal selection, [[1, 1]]
    end
  end

  describe "selection should allow 5s to be individually counted" do
    it "should return [[5]]" do
      selection = rule.select_dice(dice: [5, 2, 3, 4, 4, 6])
      assert_equal selection, [[5]]
    end

    it "should return [[1, 1]]" do
      selection = rule.select_dice(dice: [5, 2, 3, 4, 5, 6])
      assert_equal selection, [[5, 5]]
    end
  end

  describe "selection should count 3 of a kind differently for non-ones or fives" do 
    it "should return [2, 2, 2]" do
      selection = rule.select_dice(dice: [2, 2, 2, 4, 3, 6])
      assert_equal selection, [[2, 2, 2]]
    end

    it "should return []" do
      selection = rule.select_dice(dice: [3, 4, 6, 4, 3, 6])
      assert_equal selection, []
    end

    it "should return [3, 3, 3, 3]" do
      selection = rule.select_dice(dice: [3, 3, 3, 4, 3, 6])
      assert_equal selection, [[3, 3, 3, 3]]
    end
  end
end