class Game
  def initialize(player, opponent)
    @player = player
    @opponent = opponent
  end

  def end_of_game
    @player.dead? || @opponent.dead?
  end

  def next_play
    play = @player.next_play
    if play.end_of_turn?
      puts '%s: end of turn' % [@player.name]
      @player, @opponent = @opponent, @player
    else
      play.apply(@player, @opponent)
      puts '%s: %d hp; %s: %d hp' % [
        @player.name, @player.hp, @opponent.name, @opponent.hp
      ]
    end
  end
end
