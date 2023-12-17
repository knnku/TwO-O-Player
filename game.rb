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
    

    loop do
      turn = Turn.new(current_player)
      turn.start
      @scores = @players.map { |player| "#{player}: #{player.score}/#{@max_score}"}

      puts @scores
      break if current_player.score >= @max_score

      current_player = next_player(current_player)
    end

    puts "#{current_player} wins the game with a score of #{current_player.score}/#{@max_score}!"
    puts "Good bye!"
  end

  def next_player(current_player)
    current_index = @players.index(current_player)
    next_index = (current_index + 1) % @players.length
    @players[next_index]
  end
end

class Player
  attr_accessor :score

  def initialize(player_num)
    @player_num = player_num
    @score = 0
  end

  def to_s
    "Player #{@player_num + 1}"
  end
end

class Question
  attr_accessor :question, :answer

  def initialize(num_max_difficulty)
    @num1 = rand(num_max_difficulty)
    @num2 = rand(num_max_difficulty)
    @question = "What is #{@num1} plus #{@num2} equals to?"
    @answer = @num1 + @num2
  end

  def to_s
    @question
  end
end

class Turn
  def initialize(player)
    @current_player = player
    @current_question = Question.new(50)
    @answer = @current_question.answer
  end

  def start
    puts '------NEW TURN-------'
    puts "#{@current_player}: #{@current_question}"
    user_answer = gets.chomp

    if user_answer.to_i == @answer
      puts "#{@current_player} YES! You are correct."
      @current_player.score += 1
      return
    end

    puts "#{@current_player} Serously? No!"
  end
end
