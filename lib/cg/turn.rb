class Turn
  attr_reader :mana_left

  def initialize(player, opponent, mana)
    @player = player
    @opponent = opponent
    @mana = mana
    @mana_left = mana
    @plays = []
  end

  def next_play
    play = process(@player.next_play(@mana_left))
    play.apply(@player, @opponent)
    if play.end_of_turn?
      puts '%s: end of turn' % [@player.name]
    else
      puts '%s: %dhp, %s: %dhp' % [
        @player.name, @player.hp, @opponent.name, @opponent.hp
      ]
    end
  end

  def end_of_turn?
    @plays.any? && @plays.last.end_of_turn?
  end

  def end_of_game?
    @player.dead? || @opponent.dead?
  end

  def new
    Turn.new(@player, @opponent, @mana + 1)
  end

  private

  def process(play)
    @mana_left -= play.cost
    @plays << play
    play
  end
end
