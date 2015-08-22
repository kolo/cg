class Play
  class PlayNotImplementedError < StandardError
    def initialize(klass)
      @klass = klass
    end
    
    def message
      '%s#apply is not implemented' % [@klass.name]
    end
  end

  PLAY_CARD = :play_card
  END_TURN = :end_turn

  attr_reader :type

  def cost
    0
  end

  def apply(player, opponent)
    raise PlayNotImplementedError.new(self.class)
  end

  def end_of_turn?
    type == END_TURN
  end
end

class PlayCard < Play
  def initialize(card)
    @type = PLAY_CARD
    @card = card
  end

  def cost
    @card.cost
  end

  def apply(player, opponent)
    opponent.take_damage(Random.rand(5))
  end
end

class EndTurn < Play
  def initialize
    @type = END_TURN
  end

  def apply(player, opponent)
  end
end
