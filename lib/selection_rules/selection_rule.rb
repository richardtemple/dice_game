class SelectionRule
  def select_dice(dice:)
    @dice = dice
    @sets = []
    select_ones
    select_fives
    select_other_multiples
    @sets
  end

  def select_other_multiples
    
    other_numbers = [2, 3, 4, 6]
    other_numbers.each do |other_number|
      set = []
      if @dice.count(other_number) > 2
        @dice.count(other_number).times {set << other_number}
      end
      if set.count > 0
        @sets << set

      end
      @dice.delete(other_number)
    end
    
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
