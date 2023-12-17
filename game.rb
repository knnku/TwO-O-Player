class Game
  attr_accessor :players, :scores

  def initialize(player_count)
    @players = create_players(player_count)
    @scores = @players.each_with_index { |p, i| @scores[i+1] = p.score} 
    print "\nNew game created with #{@players.length} players!\n\n"
  end

  def start
    puts 'Game start!'
    Turn.new(@players)
  end

  def create_players(num_of_players)
    (1..num_of_players).map.with_index { |_p, i| Player.new(i) }
  end
end

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
  def initialize(players)
    @current_player = players.sample
    @current_question = Question.new(50)
    @answer = @current_question.answer
  end 

  def to_s
    puts '------NEW TURN-------'
    puts "#{@current_player}: #{@current_question}"
    answer = gets.chomp

    if answer.to_i === @answer
      puts "#{@current_player} YES! You are correct."
    else
      puts "#{@current_player} Serously? No!"
    end

  end 

end
