class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 30
  end

  def next_play(mana)
    if mana > 0
      PlayCard.new(Card.new)
    else
      EndTurn.new
    end
  end

  def take_damage(dmg)
    @hp -= dmg
  end

  def dead?
    @hp <= 0
  end
end
