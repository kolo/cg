PLAYER_STARTING_HP = 30

class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = PLAYER_STARTING_HP
    @turn = Turn.new
  end

  def next_play
    @turn = @turn.new if @turn.ended?

    if @turn.mana_left > 0
      @turn.play(PlayCard.new(Card.new))
    else
      @turn.play(EndTurn.new)
    end
  end

  def take_damage(dmg)
    @hp -= dmg
  end

  def dead?
    @hp <= 0
  end
end
