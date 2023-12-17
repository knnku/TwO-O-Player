class Game
  attr_accessor :players, :scores

  def initialize(player_count)
    @players = create_players(player_count)
    print "\nNew game created with #{@players.length} players!\n\n"
    @max_score = 3
  end

  def create_players(num_of_players)
    (1..num_of_players).map.with_index { |_p, i| Player.new(i) }
  end

  def start
    puts 'Game start!'
    play_game
  end

  def play_game
    current_player = @players.sample

    while current_player.score < @max_score
      turn = Turn.new(current_player)
      turn.start

      @scores = @players.map { |player| "#{player}: #{player.score}/#{@max_score}" }
      p @scores

      current_player = next_player(current_player)
    end

    puts "#{current_player} wins the game with a score of #{current_player.score}/#{@max_score}!"
    puts 'Good bye!'
  end

  def next_player(current_player)
    current_index = @players.index(current_player)
    next_index = (current_index + 1) % @players.length
    @players[next_index]
  end
end
