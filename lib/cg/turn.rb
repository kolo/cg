class Turn
  attr_reader :mana_left

  def initialize(mana = 1)
    @mana = mana
    @mana_left = mana
    @plays = []
  end

  def play(play)
    @mana_left -= play.cost
    @plays << play
    play
  end

  def ended?
    if play = @plays.last and play.end_of_turn?
      return true
    end

    false
  end

  def new
    Turn.new(@mana + 1)
  end
end
