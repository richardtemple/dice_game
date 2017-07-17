class SelectionRule
  def select_dice(dice:)
    @dice = dice
    @sets = []
    select_ones
    select_fives
    puts @sets.to_s

  end

  def set_six?
  end

  def set_five?
  end

  def set_four?
  end

  def set_three?
  end

  def select_ones
    set = []
    if @dice.count(1) > 0
      @dice.count(1).times {set << 1}
    end
    if set.count > 0
      @sets << set
    end
    @dice.delete(1)
  end

  def select_fives
    set = []
    if @dice.count(5) > 0
      @dice.count(5).times {set << 5}
    end
    if set.count > 0
      @sets << set
    end
    @dice.delete(5)
  end

end
