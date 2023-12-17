class Player
  attr_accessor :score

  def initialize(player_num)
    @player_num = player_num
    @score = 0
  end

  def to_s
    "Player #{@player_num + 1} (Score: #{@score})"
  end
end