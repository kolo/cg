class Game
  def initialize(player, opponent)
    @history = [Turn.new(opponent, player, 0)]
    @turn = Turn.new(player, opponent, 1)
  end

  def end_of_game
    @turn.end_of_game?
  end

  def next_play
    @turn.next_play
    if @turn.end_of_turn?
      @history << @turn
      @turn = @history[-2].new
    end
  end
end
